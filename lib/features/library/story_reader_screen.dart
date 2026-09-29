import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/l10n/i18n_ui.dart';
import '../../core/theme/tokens.dart';
import '../../data/content/library.dart';
import '../../data/models/models.dart';
import '../../data/speech/premium_tts_service.dart';
import '../../data/speech/speech_controller.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';

class StoryReaderScreen extends ConsumerStatefulWidget {
  const StoryReaderScreen({super.key, required this.story});
  final LibraryStory story;

  @override
  ConsumerState<StoryReaderScreen> createState() => _StoryReaderScreenState();
}

class _StoryReaderScreenState extends ConsumerState<StoryReaderScreen> {
  final _speech = SpeechController();
  int? _playingIndex;
  bool _playingAll = false;

  @override
  void initState() {
    super.initState();
    _speech.warmUp();
  }

  @override
  void dispose() {
    _speech.dispose();
    super.dispose();
  }

  /// Önce ElevenLabs (Plus + sunucu yapılandırılmışsa) dener; başarısız
  /// olursa (ücretsiz kullanıcı, servis kapalı, ağ hatası) cihazın kendi
  /// TTS'ine düşer. Kullanıcı için tek fark ses kalitesi — akış aynı.
  Future<void> _speakSentence(String text) async {
    final usedPremium = await PremiumTtsService.speak(
      text,
      lang: widget.story.lang.code,
    );
    if (usedPremium) {
      await PremiumTtsService.waitUntilDone();
      return;
    }
    await _speech.speakTarget(text, widget.story.lang.code);
    // flutter_tts'in tamamlanma bildirimini beklemek yerine ortalama bir
    // okuma süresi kadar bekliyoruz -- SpeechController şu an bir
    // "bitti" callback'i sunmuyor.
    final ms = (text.length * 65).clamp(900, 6000);
    await Future.delayed(Duration(milliseconds: ms));
  }

  Future<void> _speakOne(int index) async {
    if (_playingAll) return;
    setState(() => _playingIndex = index);
    await _speakSentence(widget.story.sentences[index].target);
    if (mounted) setState(() => _playingIndex = null);
  }

  Future<void> _playAll() async {
    if (_playingAll) return;
    setState(() => _playingAll = true);
    for (var i = 0; i < widget.story.sentences.length; i++) {
      if (!mounted || !_playingAll) break;
      setState(() => _playingIndex = i);
      await _speakSentence(widget.story.sentences[i].target);
    }
    if (mounted) {
      setState(() {
        _playingAll = false;
        _playingIndex = null;
      });
    }
  }

  void _stopAll() {
    setState(() {
      _playingAll = false;
      _playingIndex = null;
    });
    _speech.stopSpeak();
    PremiumTtsService.stop();
  }

  @override
  Widget build(BuildContext context) {
    final story = widget.story;
    final rtl = story.lang.isRtl;
    final uiLang = ref.watch(sessionProvider).uiLang;
    final i18n = ref.watch(i18nProvider);
    // Çeviri yoksa (assets/content/i18n) hedef dildeki başlık gösterilir ve
    // cümle çevirisi gizlenir — başka dilde kullanıcıya Türkçe gösterilmez.
    return Scaffold(
      appBar: VoxelithAppBar(pageTitle: Text(story.displayTitle(uiLang))),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(22, 16, 22, 8),
                children: [
                  Directionality(
                    textDirection: rtl ? TextDirection.rtl : TextDirection.ltr,
                    child: Text(
                      story.title,
                      textAlign: rtl ? TextAlign.right : TextAlign.left,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${story.level.name.toUpperCase()} · ${story.lang.label(uiLang)}',
                    style: const TextStyle(color: Voxelith.muted, fontSize: 12),
                  ),
                  const SizedBox(height: 18),
                  for (var i = 0; i < story.sentences.length; i++) ...[
                    _SentenceCard(
                      sentence: story.sentences[i],
                      rtl: rtl,
                      gloss: story.sentenceGloss(i, uiLang),
                      playing: _playingIndex == i,
                      onSpeak: () => _speakOne(i),
                    ),
                    const SizedBox(height: 10),
                  ],
                ],
              ),
            ),
            SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(22, 8, 22, 16),
                child: FilledButton.icon(
                  onPressed: _playingAll ? _stopAll : _playAll,
                  icon: Icon(_playingAll ? Icons.stop : Icons.play_arrow),
                  label: Text(_playingAll ? i18n.stopCta : i18n.playAll),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SentenceCard extends StatelessWidget {
  const _SentenceCard({
    required this.sentence,
    required this.rtl,
    required this.gloss,
    required this.playing,
    required this.onSpeak,
  });

  final LibrarySentence sentence;
  final bool rtl;
  final String? gloss;
  final bool playing;
  final VoidCallback onSpeak;

  @override
  Widget build(BuildContext context) {
    return VoxelithCard(
      color: playing ? Voxelith.mintLight : null,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Directionality(
                  textDirection: rtl ? TextDirection.rtl : TextDirection.ltr,
                  child: Text(
                    sentence.target,
                    textAlign: rtl ? TextAlign.right : TextAlign.left,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      height: 1.4,
                    ),
                  ),
                ),
                if (gloss != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    gloss!,
                    style: const TextStyle(color: Voxelith.muted, fontSize: 13),
                  ),
                ],
              ],
            ),
          ),
          IconButton(
            onPressed: onSpeak,
            icon: Icon(
              playing ? Icons.volume_up : Icons.volume_up_outlined,
              color: playing ? Voxelith.mintDark : Voxelith.soft,
            ),
          ),
        ],
      ),
    );
  }
}
