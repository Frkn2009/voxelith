import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/l10n/i18n.dart';
import '../../../core/l10n/i18n_ui.dart';
import '../../../core/legal_info.dart';
import '../../../core/theme/tokens.dart';
import '../../../data/models/models.dart';
import '../../../data/speech/premium_tts_service.dart';
import '../../../data/speech/speech_controller.dart';
import '../../../state/session.dart';
import '../../../ui/widgets.dart';
import '../data/live_chat_service.dart';

class _Bubble {
  const _Bubble({required this.fromUser, required this.text});
  final bool fromUser;
  final String text;
}

class LiveChatScreen extends ConsumerStatefulWidget {
  const LiveChatScreen({super.key});

  @override
  ConsumerState<LiveChatScreen> createState() => _LiveChatScreenState();
}

class _LiveChatScreenState extends ConsumerState<LiveChatScreen> {
  final _speech = SpeechController();
  final _input = TextEditingController();
  final _scroll = ScrollController();
  final _messages = <_Bubble>[];
  bool _sending = false;
  bool _listening = false;
  String? _error;
  bool _errorIsLimit = false;

  Future<void> _speakReply(String reply, String langCode) async {
    final usedPremium = await PremiumTtsService.speak(reply, lang: langCode);
    if (!usedPremium) {
      await _speech.speakTarget(reply, langCode);
    }
  }

  @override
  void initState() {
    super.initState();
    _speech.warmUp();
  }

  @override
  void dispose() {
    _speech.dispose();
    _input.dispose();
    _scroll.dispose();
    super.dispose();
  }

  void _scrollToEnd() {
    if (!_scroll.hasClients) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scroll.hasClients) return;
      _scroll.animateTo(
        _scroll.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
      );
    });
  }

  Future<void> _toggleMic(String langCode) async {
    if (_listening) {
      final text = await _speech.stopListen();
      setState(() {
        _listening = false;
        if (text.isNotEmpty) _input.text = text;
      });
      return;
    }
    final started = await _speech.startListen(
      langCode: langCode,
      onTick: (_) {},
      onText: (text) => setState(() => _input.text = text),
    );
    setState(() => _listening = started);
  }

  Future<void> _send() async {
    final text = _input.text.trim();
    if (text.isEmpty || _sending) return;
    final p = ref.read(sessionProvider);
    final history = _messages
        .map((b) => ChatTurn(role: b.fromUser ? 'user' : 'ai', text: b.text))
        .toList();

    setState(() {
      _messages.add(_Bubble(fromUser: true, text: text));
      _input.clear();
      _sending = true;
      _error = null;
    });
    _scrollToEnd();

    try {
      final reply = await LiveChatService.reply(
        message: text,
        targetLanguage: p.learnLang.code,
        nativeLanguage: p.uiLang.code,
        level: p.cefr.name,
        history: history,
      );
      if (!mounted) return;
      setState(() {
        _messages.add(_Bubble(fromUser: false, text: reply));
        _sending = false;
      });
      _scrollToEnd();
      unawaited(_speakReply(reply, p.learnLang.code));
    } on LiveChatException catch (e) {
      if (!mounted) return;
      final i18n = ref.read(i18nProvider);
      setState(() {
        _sending = false;
        _errorIsLimit =
            e.code == 'plus_required' || e.code == 'daily_limit_reached';
        _error = switch (e.code) {
          'plus_required' => i18n.liveChatPlusOnly,
          'authentication_required' => i18n.liveChatSignInFirst,
          'daily_limit_reached' => i18n.liveChatDailyLimit,
          _ => i18n.liveChatConnectFailed,
        };
      });
    } catch (_) {
      if (!mounted) return;
      final i18n = ref.read(i18nProvider);
      setState(() {
        _sending = false;
        _errorIsLimit = false;
        _error = i18n.liveChatConnectFailed;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final p = ref.watch(sessionProvider);
    final i18n = ref.watch(i18nProvider);
    if (!p.isPlus) {
      return _LockedChatView(
        i18n: i18n,
        onUpgrade: () => context.push('/paywall'),
      );
    }

    final learnLabel = p.learnLang.label(p.uiLang);

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.0, 0.4],
          colors: [
            Voxelith.accent.withValues(alpha: .07),
            Theme.of(context).scaffoldBackgroundColor,
          ],
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            _ChatHeader(subtitle: i18n.liveChatOnline(learnLabel)),
            Expanded(
              child: _messages.isEmpty && !_sending
                  ? _EmptyState(i18n: i18n, learnLabel: learnLabel)
                  : ListView.builder(
                      controller: _scroll,
                      padding: const EdgeInsets.fromLTRB(14, 8, 14, 12),
                      itemCount: _messages.length + (_sending ? 1 : 0),
                      itemBuilder: (_, i) {
                        if (i == _messages.length) {
                          return const _PopIn(child: _TypingBubble());
                        }
                        return _PopIn(
                          key: ValueKey(i),
                          child: _ChatBubble(bubble: _messages[i]),
                        );
                      },
                    ),
            ),
            if (_error != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 0, 18, 8),
                child: Row(
                  children: [
                    if (_errorIsLimit)
                      const Padding(
                        padding: EdgeInsets.only(right: 6),
                        child: VoxelithMascot(
                          size: 28,
                          mood: MascotMood.encourage,
                          animate: false,
                        ),
                      )
                    else
                      const Icon(
                        Icons.error_outline,
                        size: 16,
                        color: Voxelith.coral,
                      ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        _error!,
                        style: const TextStyle(
                          color: Voxelith.coral,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    if (_errorIsLimit)
                      TextButton(
                        onPressed: () => context.push('/paywall'),
                        child: Text(i18n.goPlusCta),
                      ),
                  ],
                ),
              ),
            _ChatInputBar(
              hint: i18n.typeSomething,
              controller: _input,
              listening: _listening,
              sending: _sending,
              onMic: () => _toggleMic(p.learnLang.code),
              onSend: _send,
            ),
          ],
        ),
      ),
    );
  }
}

class _LockedChatView extends StatelessWidget {
  const _LockedChatView({required this.i18n, required this.onUpgrade});
  final I18n i18n;
  final VoidCallback onUpgrade;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: VoxelithCard(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const VoxelithMascot(size: 76, mood: MascotMood.wave),
              const SizedBox(height: 12),
              Text(
                i18n.liveChatLockedTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                i18n.liveChatLockedBody,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Voxelith.muted),
              ),
              const SizedBox(height: 16),
              FilledButton(onPressed: onUpgrade, child: Text(i18n.goPlusCta)),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChatHeader extends StatefulWidget {
  const _ChatHeader({required this.subtitle});
  final String subtitle;

  @override
  State<_ChatHeader> createState() => _ChatHeaderState();
}

class _ChatHeaderState extends State<_ChatHeader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulse = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1600),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Row(
        children: [
          const VoxelithMascot(size: 38),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Voxelith',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
                Text(
                  widget.subtitle,
                  style: const TextStyle(fontSize: 12, color: Voxelith.muted),
                ),
              ],
            ),
          ),
          AnimatedBuilder(
            animation: _pulse,
            builder: (_, _) => Container(
              width: 9,
              height: 9,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Voxelith.primary,
                boxShadow: [
                  BoxShadow(
                    color: Voxelith.primary.withValues(
                      alpha: .15 + .35 * _pulse.value,
                    ),
                    blurRadius: 6 + 6 * _pulse.value,
                    spreadRadius: 1 + 2 * _pulse.value,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.i18n, required this.learnLabel});
  final I18n i18n;
  final String learnLabel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const VoxelithMascot(size: 88, mood: MascotMood.encourage),
            const SizedBox(height: 18),
            Text(
              i18n.liveChatEmpty(learnLabel),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Voxelith.muted, height: 1.4),
            ),
            const SizedBox(height: 10),
            Text(
              i18n.liveChatReportHint,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Voxelith.soft,
                fontSize: 12,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Bir mesaj balonunun ilk çizimde yumuşakça belirmesi — sohbetin cansız,
/// aniden beliren metinler yerine "canlı" hissetmesi için.
class _PopIn extends StatelessWidget {
  const _PopIn({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOutBack,
      builder: (_, v, c) => Opacity(
        opacity: v.clamp(0, 1),
        child: Transform.translate(
          offset: Offset(0, (1 - v.clamp(0.0, 1.0)) * 12),
          child: c,
        ),
      ),
      child: child,
    );
  }
}

class _ChatBubble extends StatelessWidget {
  const _ChatBubble({required this.bubble});
  final _Bubble bubble;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final fromUser = bubble.fromUser;
    final content = Container(
      constraints: const BoxConstraints(maxWidth: 280),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
      decoration: BoxDecoration(
        gradient: fromUser ? Voxelith.heroGradient : null,
        color: fromUser ? null : Theme.of(context).cardColor,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(18),
          topRight: const Radius.circular(18),
          bottomLeft: Radius.circular(fromUser ? 18 : 4),
          bottomRight: Radius.circular(fromUser ? 4 : 18),
        ),
        border: !fromUser && isDark
            ? Border.all(color: Theme.of(context).dividerColor)
            : null,
        boxShadow: isDark
            ? null
            : [
                BoxShadow(
                  color: (fromUser ? Voxelith.accent : Colors.black).withValues(
                    alpha: fromUser ? .22 : .07,
                  ),
                  blurRadius: fromUser ? 14 : 10,
                  offset: const Offset(0, 5),
                ),
              ],
      ),
      child: Text(
        bubble.text,
        style: TextStyle(
          color: fromUser
              ? Colors.white
              : Theme.of(context).colorScheme.onSurface,
          height: 1.35,
        ),
      ),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: fromUser
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!fromUser) ...[
            const VoxelithMascot(size: 26, animate: false),
            const SizedBox(width: 6),
          ],
          Flexible(
            // Google Play'in "AI ile üretilen içerik" politikası (Temmuz
            // 2026) uygulama içinden çıkmadan bildirim/işaretleme aracı
            // zorunlu tutuyor — sadece AI cevaplarında (kullanıcının
            // kendi mesajında değil) uzun basınca bildirme diyaloğu açılır.
            child: fromUser
                ? content
                : GestureDetector(
                    onLongPress: () => _reportAiMessage(context, bubble.text),
                    child: content,
                  ),
          ),
        ],
      ),
    );
  }
}

Future<void> _reportAiMessage(BuildContext context, String text) async {
  final i18n = ProviderScope.containerOf(
    context,
    listen: false,
  ).read(i18nProvider);
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(i18n.reportMessageTitle),
      content: Text(i18n.reportAiBody),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(ctx, false),
          child: Text(i18n.cancelCta),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(ctx, true),
          child: Text(i18n.reportCta),
        ),
      ],
    ),
  );
  if (confirmed != true || !context.mounted) return;
  final uri = Uri(
    scheme: 'mailto',
    path: LegalInfo.supportEmail,
    query:
        'subject=${Uri.encodeComponent('VOXELITH Sohbet - içerik bildirimi')}'
        '&body=${Uri.encodeComponent('Bildirilen AI cevabı:\n\n$text')}',
  );
  await launchUrl(uri);
}

class _TypingBubble extends StatefulWidget {
  const _TypingBubble();

  @override
  State<_TypingBubble> createState() => _TypingBubbleState();
}

class _TypingBubbleState extends State<_TypingBubble>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1000),
  )..repeat();

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const VoxelithMascot(size: 26, animate: false),
          const SizedBox(width: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
                bottomRight: Radius.circular(18),
                bottomLeft: Radius.circular(4),
              ),
              border: isDark
                  ? Border.all(color: Theme.of(context).dividerColor)
                  : null,
              boxShadow: isDark
                  ? null
                  : [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: .07),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
            ),
            child: AnimatedBuilder(
              animation: _c,
              builder: (_, _) => Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(3, (i) {
                  final t = (_c.value - i * .2) % 1.0;
                  final bounce = math.sin(t * math.pi).clamp(0.0, 1.0);
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Transform.translate(
                      offset: Offset(0, -4 * bounce),
                      child: Container(
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Voxelith.muted,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Dairesel, gölgeli/gradyanlı bir aksiyon düğmesi — düz `IconButton`ların
/// verdiği yassı görünüm yerine sohbet çubuğuna hafif "kabartma" (3D) hissi.
class _CircleButton extends StatelessWidget {
  const _CircleButton({
    required this.onTap,
    required this.child,
    this.color,
    this.gradient,
    this.shadow,
    this.size = 46,
  });

  final VoidCallback? onTap;
  final Widget child;
  final Color? color;
  final Gradient? gradient;
  final List<BoxShadow>? shadow;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: gradient == null ? color : null,
        gradient: gradient,
        boxShadow: shadow,
      ),
      child: Material(
        color: Colors.transparent,
        shape: const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onTap,
          child: Center(child: child),
        ),
      ),
    );
  }
}

class _ChatInputBar extends StatefulWidget {
  const _ChatInputBar({
    required this.hint,
    required this.controller,
    required this.listening,
    required this.sending,
    required this.onMic,
    required this.onSend,
  });

  final String hint;
  final TextEditingController controller;
  final bool listening;
  final bool sending;
  final VoidCallback onMic;
  final VoidCallback onSend;

  @override
  State<_ChatInputBar> createState() => _ChatInputBarState();
}

class _ChatInputBarState extends State<_ChatInputBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _breathe = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1100),
  )..repeat(reverse: true);
  bool _sendPressed = false;

  @override
  void dispose() {
    _breathe.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AnimatedBuilder(
              animation: _breathe,
              builder: (_, _) {
                final glowColor = widget.listening
                    ? Voxelith.coral
                    : Voxelith.mintDark;
                final t = widget.listening
                    ? _breathe.value
                    : _breathe.value * .35;
                return _CircleButton(
                  size: 46,
                  onTap: widget.onMic,
                  color: widget.listening
                      ? Voxelith.coral.withValues(alpha: .12)
                      : Theme.of(context).cardColor,
                  shadow: [
                    BoxShadow(
                      color: glowColor.withValues(alpha: .16 + .18 * t),
                      blurRadius: 8 + 10 * t,
                      spreadRadius: 1 + 2 * t,
                    ),
                  ],
                  child: Icon(
                    widget.listening ? Icons.mic : Icons.mic_none,
                    color: widget.listening
                        ? Voxelith.coral
                        : Voxelith.mintDark,
                  ),
                );
              },
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: Theme.of(
                      context,
                    ).dividerColor.withValues(alpha: isDark ? 1 : .6),
                  ),
                  boxShadow: isDark
                      ? null
                      : [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: .05),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                ),
                child: TextField(
                  controller: widget.controller,
                  minLines: 1,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: widget.hint,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 12,
                    ),
                  ),
                  onSubmitted: (_) => widget.onSend(),
                ),
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTapDown: (_) => setState(() => _sendPressed = true),
              onTapUp: (_) => setState(() => _sendPressed = false),
              onTapCancel: () => setState(() => _sendPressed = false),
              child: AnimatedScale(
                scale: _sendPressed ? .88 : 1,
                duration: const Duration(milliseconds: 110),
                curve: Curves.easeOut,
                child: _CircleButton(
                  size: 46,
                  onTap: widget.sending ? null : widget.onSend,
                  color: widget.sending ? Voxelith.fog : null,
                  gradient: widget.sending ? null : Voxelith.heroGradient,
                  shadow: widget.sending
                      ? null
                      : [
                          BoxShadow(
                            color: Voxelith.accent.withValues(alpha: .35),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                  child: widget.sending
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Voxelith.muted,
                          ),
                        )
                      : const Icon(
                          Icons.send_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
