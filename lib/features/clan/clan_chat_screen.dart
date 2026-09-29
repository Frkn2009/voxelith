import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/l10n/i18n.dart';
import '../../core/l10n/i18n_ui.dart';
import '../../core/legal_info.dart';
import '../../core/theme/tokens.dart';
import '../../data/models/clan.dart';
import '../../data/supabase/supa_service.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';

class ClanChatScreen extends ConsumerStatefulWidget {
  const ClanChatScreen({super.key});

  @override
  ConsumerState<ClanChatScreen> createState() => _ClanChatScreenState();
}

class _ClanChatScreenState extends ConsumerState<ClanChatScreen> {
  I18n get _i18n => ref.read(i18nProvider);

  static const _blockedKey = 'voxelith.clan.blocked_user_ids';

  final _input = TextEditingController();
  Future<List<ClanChatMessage>>? _request;
  bool _sending = false;
  Set<String> _blockedUserIds = {};

  @override
  void initState() {
    super.initState();
    _request = Supa.clanMessages();
    _loadBlockedUsers();
  }

  Future<void> _loadBlockedUsers() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    setState(() {
      _blockedUserIds = (prefs.getStringList(_blockedKey) ?? []).toSet();
    });
  }

  Future<void> _blockUser(String userId, String playerName) async {
    final prefs = await SharedPreferences.getInstance();
    final updated = {..._blockedUserIds, userId};
    await prefs.setStringList(_blockedKey, updated.toList());
    if (!mounted) return;
    setState(() => _blockedUserIds = updated);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _i18n.blockedUserSnack(_i18n.playerDisplayName(playerName)),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _input.dispose();
    super.dispose();
  }

  Future<void> _send() async {
    final text = _input.text.trim();
    if (text.isEmpty || _sending) return;
    setState(() => _sending = true);
    try {
      await Supa.sendClanMessage(text);
      _input.clear();
      setState(() => _request = Supa.clanMessages());
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  // Apple/Google'ın kullanıcı-kullanıcı iletişimi kuralı (App Store 1.2,
  // Google Play kullanıcı-üretimli içerik politikası) uygulama içinden
  // çıkmadan bildirme + engelleme aracı zorunlu tutuyor. Engelleme burada
  // istemci tarafında: engellenen kullanıcının mesajları bu cihazda bir
  // daha listelenmiyor (aşağıdaki filtre), sunucu tarafı değişikliği
  // gerektirmiyor.
  Future<void> _showMessageActions(ClanChatMessage m) async {
    final action = await showModalBottomSheet<String>(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.flag_outlined, color: Voxelith.coral),
              title: Text(_i18n.reportMessageTitle),
              onTap: () => Navigator.pop(ctx, 'report'),
            ),
            ListTile(
              leading: const Icon(Icons.block, color: Voxelith.coral),
              title: Text(
                _i18n.blockUser(_i18n.playerDisplayName(m.playerName)),
              ),
              onTap: () => Navigator.pop(ctx, 'block'),
            ),
            ListTile(
              leading: const Icon(Icons.close),
              title: Text(_i18n.cancelCta),
              onTap: () => Navigator.pop(ctx),
            ),
          ],
        ),
      ),
    );
    if (!mounted) return;
    if (action == 'block') {
      await _blockUser(m.userId, m.playerName);
    } else if (action == 'report') {
      final uri = Uri(
        scheme: 'mailto',
        path: LegalInfo.supportEmail,
        query:
            'subject=${Uri.encodeComponent('VOXELITH Klan Sohbeti - içerik bildirimi')}'
            '&body=${Uri.encodeComponent('Bildirilen kullanıcı: ${m.playerName}\nMesaj:\n\n${m.text}')}',
      );
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final i18n = ref.watch(i18nProvider);
    return Scaffold(
      appBar: VoxelithAppBar(
        pageTitle: Text(i18n.clanChatTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: i18n.refreshTooltip,
            onPressed: () => setState(() => _request = Supa.clanMessages()),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<List<ClanChatMessage>>(
                future: _request,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        i18n.clanChatLoadFailed,
                        style: const TextStyle(color: Voxelith.muted),
                      ),
                    );
                  }
                  final messages = (snapshot.data ?? const [])
                      .where(
                        (m) => m.isMe || !_blockedUserIds.contains(m.userId),
                      )
                      .toList();
                  if (messages.isEmpty) {
                    return Center(
                      child: Text(
                        i18n.clanChatEmpty,
                        style: const TextStyle(color: Voxelith.muted),
                      ),
                    );
                  }
                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: messages.length,
                    itemBuilder: (_, i) {
                      final m = messages[i];
                      return Align(
                        alignment: m.isMe
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: GestureDetector(
                          onLongPress: m.isMe
                              ? null
                              : () => _showMessageActions(m),
                          child: Container(
                            constraints: const BoxConstraints(maxWidth: 280),
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: m.isMe
                                  ? Voxelith.mintDark
                                  : Voxelith.cloud,
                              borderRadius: BorderRadius.circular(
                                Voxelith.radius,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (!m.isMe)
                                  Text(
                                    i18n.playerDisplayName(m.playerName),
                                    style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700,
                                      color: Voxelith.mintDark,
                                    ),
                                  ),
                                Text(
                                  m.text,
                                  style: TextStyle(
                                    color: m.isMe ? Colors.white : Voxelith.ink,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _input,
                        decoration: InputDecoration(
                          hintText: i18n.clanChatHint,
                        ),
                        onSubmitted: (_) => _send(),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton.filled(
                      onPressed: _sending ? null : _send,
                      icon: const Icon(Icons.send),
                      tooltip: i18n.sendTooltip,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
