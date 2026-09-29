import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/features.dart';
import '../../core/l10n/i18n.dart';
import '../../core/l10n/i18n_ui.dart';
import '../../core/theme/tokens.dart';
import '../../data/ads/ad_service.dart';
import '../../data/content/catalog.dart';
import '../../data/content/language_guides.dart';
import '../../data/events/analytics_events.dart';
import '../../data/models/models.dart';
import '../../data/speech/premium_tts_service.dart';
import '../../data/speech/speech_controller.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';
import '../ai/screen/ai_feedback_screen.dart';

class SpeakHubScreen extends ConsumerWidget {
  const SpeakHubScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final i18n = ref.watch(i18nProvider);
    final p = ref.watch(sessionProvider);
    final scenes = Catalog.forLang(p.learnLang);
    final remain = p.remainingSpeakSeconds();

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(22, 16, 22, 28),
        children: [
          Text(i18n.speak, style: Theme.of(context).textTheme.displayMedium),
          const SizedBox(height: 6),
          Text(
            p.isPlus
                ? i18n.speakPlusSubtitle
                : '${i18n.remainingToday}: ${remain}s',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 16),
          VoxelithCard(
            onTap: () => context.push('/clips'),
            color: Voxelith.mintLight,
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Voxelith.mintDark,
                    borderRadius: BorderRadius.circular(Voxelith.radius),
                  ),
                  child: const Icon(
                    Icons.play_arrow_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 13),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        i18n.clips,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        i18n.speakClipsSubtitle,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right, color: Voxelith.mintDark),
              ],
            ),
          ),
          const SizedBox(height: 10),
          if (!p.isPlus && remain <= 0)
            VoxelithCard(
              color: Voxelith.pale,
              onTap: () => context.push('/paywall'),
              child: Row(
                children: [
                  const VoxelithMascot(
                    size: 32,
                    mood: MascotMood.encourage,
                    animate: false,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      i18n.plusCta,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Voxelith.forest,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 10),
          for (final level in Cefr.values)
            if (scenes.any((s) => s.cefr == level))
              _LevelSection(
                level: level,
                scenes: scenes.where((s) => s.cefr == level).toList(),
                unlocked: _levelUnlocked(level, scenes, p.completedSceneIds),
                uiLang: p.uiLang,
                i18n: i18n,
              ),
        ],
      ),
    );
  }

  /// A1 her zaman açık. Diğer her seviye, kendinden önceki seviyenin
  /// sahnelerinin en az %70'i tamamlanmadan kilitli kalır — düz bir liste
  /// yerine gerçek bir kursun "önce bunu bitir" hissini vermek için.
  static bool _levelUnlocked(
    Cefr level,
    List<Scenario> allScenes,
    Set<String> completedSceneIds,
  ) {
    if (level == Cefr.a1) return true;
    for (final prev in Cefr.values.where((c) => c.index < level.index)) {
      final prevScenes = allScenes.where((s) => s.cefr == prev).toList();
      if (prevScenes.isEmpty) continue;
      final done = prevScenes
          .where((s) => completedSceneIds.contains(s.id))
          .length;
      if (done / prevScenes.length < 0.7) return false;
    }
    return true;
  }
}

class _LevelSection extends StatelessWidget {
  const _LevelSection({
    required this.level,
    required this.scenes,
    required this.unlocked,
    required this.uiLang,
    required this.i18n,
  });

  final Cefr level;
  final List<Scenario> scenes;
  final bool unlocked;
  final UiLang uiLang;
  final I18n i18n;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                i18n.speakLevelLabel(level),
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
              if (!unlocked) ...[
                const SizedBox(width: 6),
                Icon(
                  Icons.lock_outline,
                  size: 16,
                  color: Theme.of(context).colorScheme.outline,
                ),
              ],
            ],
          ),
          if (!unlocked)
            Padding(
              padding: const EdgeInsets.only(top: 2, bottom: 6),
              child: Text(
                i18n.speakLevelLocked,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  fontSize: 12,
                ),
              ),
            )
          else
            const SizedBox(height: 6),
          for (final s in scenes)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Opacity(
                opacity: unlocked ? 1 : 0.5,
                child: VoxelithCard(
                  onTap: unlocked
                      ? () => context.push('/session?id=${s.id}')
                      : null,
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Voxelith.forest,
                        child: Text(
                          s.lang.flag(),
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              s.title(uiLang),
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              '${i18n.minutesShort(s.minutes)} · ${s.cefr.name.toUpperCase()} · ${i18n.turnsCount(s.turns.length)}',
                              style: TextStyle(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurfaceVariant,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        unlocked ? Icons.chevron_right : Icons.lock_outline,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

enum _Step { hear, shadow, speak, fix }

class SpeakSessionScreen extends ConsumerStatefulWidget {
  const SpeakSessionScreen({super.key, required this.scenarioId});
  final String scenarioId;

  @override
  ConsumerState<SpeakSessionScreen> createState() => _SpeakSessionScreenState();
}

/// [LearningStyle] tercihine göre adım sırası. Her sıra `speak` ile biter
/// hemen öncesinde `fix` gelir — "tekrar dene" mantığı buna güvenir (bkz.
/// [_SpeakSessionScreenState._retrySpeak]).
List<_Step> _stepOrderFor(LearningStyle style) => switch (style) {
  LearningStyle.balanced => const [
    _Step.hear,
    _Step.shadow,
    _Step.speak,
    _Step.fix,
  ],
  LearningStyle.speakingFirst => const [_Step.speak, _Step.fix],
  LearningStyle.listeningHeavy => const [
    _Step.hear,
    _Step.shadow,
    _Step.hear,
    _Step.speak,
    _Step.fix,
  ],
};

String _stepLabel(I18n i18n, _Step step) => switch (step) {
  _Step.hear => i18n.stepHear,
  _Step.shadow => i18n.stepShadow,
  _Step.speak => i18n.stepSpeak,
  _Step.fix => i18n.stepFix,
};

class _SpeakSessionScreenState extends ConsumerState<SpeakSessionScreen> {
  int turn = 0;
  int stepIndex = 0;
  bool holding = false;
  bool _pressActive = false;
  bool _speechReady = false;
  int holdSec = 0;
  int score = 0;
  int phonemeScore = 0;
  int fluencyScore = 0;
  int clarityScore = 0;
  String pronunciationFeedback = '';
  final speech = SpeechController();
  String heard = '';

  @override
  void initState() {
    super.initState();
    _prepareSpeech();
    if (ref.read(sessionProvider).completedScenes == 0) {
      AnalyticsEvents.log(AnalyticsEvents.firstLessonStarted);
    }
  }

  Future<void> _prepareSpeech() async {
    final ready = await speech.warmUp();
    if (mounted) setState(() => _speechReady = ready);
  }

  Scenario get scene =>
      Catalog.byId(widget.scenarioId) ?? Catalog.forLang(LearnLang.en).first;

  List<_Step> get _stepOrder =>
      _stepOrderFor(ref.read(sessionProvider).learningStyle);

  _Step get step => _stepOrder[stepIndex.clamp(0, _stepOrder.length - 1)];

  SpeakTurn get currentTurn =>
      scene.turns[turn.clamp(0, scene.turns.length - 1)];

  Phrase get currentPhrase =>
      scene.phrases[turn.clamp(0, scene.phrases.length - 1)];

  @override
  void dispose() {
    speech.dispose();
    super.dispose();
  }

  void _gate() {
    if (mounted) setState(() => holding = false);
    context.push('/ad');
  }

  String _microphoneMessage() {
    final i18n = ref.read(i18nProvider);
    return switch (speech.availability) {
      SpeechAvailability.permissionPermanentlyDenied =>
        i18n.interpreterMicPermanentlyDenied,
      SpeechAvailability.permissionDenied =>
        i18n.interpreterMicPermissionDenied,
      SpeechAvailability.unavailable => i18n.micUnavailableTryPhone,
      _ => i18n.interpreterMicStartFailed,
    };
  }

  Future<void> _down() async {
    final p = ref.read(sessionProvider);
    if (!p.isPlus && p.remainingSpeakSeconds() <= 0) {
      _gate();
      return;
    }

    _pressActive = true;
    if (mounted) {
      setState(() {
        holdSec = 0;
        heard = '';
      });
    }

    final started = await speech.startListen(
      langCode: scene.lang.code,
      onTick: (seconds) {
        if (!mounted || !holding) return;
        setState(() => holdSec = seconds);
        ref.read(sessionProvider.notifier).consumeSpeak(1);
        if (!ref.read(sessionProvider).isPlus &&
            ref.read(sessionProvider).remainingSpeakSeconds() <= 0) {
          _up().then((_) {
            if (mounted) _gate();
          });
        }
      },
      onText: (text) {
        if (mounted) setState(() => heard = text);
      },
    );

    if (!_pressActive) {
      if (started) await speech.stopListen();
      return;
    }
    if (!started) {
      _pressActive = false;
      if (!mounted) return;
      setState(() {
        holding = false;
        _speechReady = false;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(_microphoneMessage())));
      return;
    }
    if (mounted) {
      setState(() {
        holding = true;
        _speechReady = true;
      });
    }
  }

  Future<void> _up() async {
    _pressActive = false;
    if (!holding) return;
    final text = await speech.stopListen();
    final recognized = text.isEmpty ? heard : text;
    final assessment = speech.assessPronunciation(
      expected: currentTurn.expected,
      heard: recognized,
      languageCode: scene.lang.code,
    );
    final result = assessment.overall;
    if (!mounted) return;
    setState(() {
      holding = false;
      score = result;
      phonemeScore = assessment.phonemeAccuracy;
      fluencyScore = assessment.fluency;
      clarityScore = assessment.clarity;
      pronunciationFeedback = ref
          .read(i18nProvider)
          .pronunciationFeedback(assessment.feedbackKind);
      stepIndex = _stepOrder.length - 1;
    });
    if (recognized.trim().isNotEmpty) {
      await ref.read(sessionProvider.notifier).learnPhrase(currentPhrase.id);
      if (result >= 70) {
        await ref.read(sessionProvider.notifier).awardXp(10);
      }
    }
  }

  void _nextStep() {
    setState(() {
      stepIndex = (stepIndex + 1) % _stepOrder.length;
    });
  }

  /// "Tekrar dene" — her sıra `[..., speak, fix]` ile bittiği için son
  /// `speak` konumu her zaman sondan bir önceki indekstir.
  void _retrySpeak() {
    setState(() => stepIndex = _stepOrder.length - 2);
  }

  Future<void> _nextTurn() async {
    if (turn < scene.turns.length - 1) {
      setState(() {
        turn++;
        stepIndex = 0;
        score = 0;
        phonemeScore = 0;
        fluencyScore = 0;
        clarityScore = 0;
        pronunciationFeedback = '';
      });
    } else {
      final sceneXp = await ref
          .read(sessionProvider.notifier)
          .completeScene(scene.lang, sceneId: scene.id);
      final latest = ref.read(sessionProvider);
      if (latest.canShowInterstitial() && await AdService.showInterstitial()) {
        if (!mounted) return;
        await ref.read(sessionProvider.notifier).recordInterstitial();
      }
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(ref.read(i18nProvider).sceneCompleted(sceneXp))),
      );
      context.go('/app');
    }
  }

  @override
  Widget build(BuildContext context) {
    final i18n = ref.watch(i18nProvider);
    final p = ref.watch(sessionProvider);
    final remain = p.remainingSpeakSeconds();
    final order = _stepOrder;

    return Scaffold(
      backgroundColor: Voxelith.forest,
      appBar: VoxelithAppBar(
        backgroundColor: Voxelith.forest,
        foregroundColor: Voxelith.cream,
        pageTitle: Text(scene.title(p.uiLang)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16, top: 18),
            child: Text(
              p.isPlus ? '∞' : '${remain}s',
              style: TextStyle(
                color: p.isPlus
                    ? Voxelith.terrSoft
                    : (remain <= 5
                          ? Voxelith.coral
                          : (remain <= 15 ? Voxelith.gold : Voxelith.terrSoft)),
                fontWeight: !p.isPlus && remain <= 15
                    ? FontWeight.w800
                    : FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (final entry in order.asMap().entries)
                    Text(
                      '${entry.key + 1}  ${_stepLabel(i18n, entry.value)}',
                      style: TextStyle(
                        color: entry.key == stepIndex
                            ? Voxelith.terrSoft
                            : Theme.of(context).colorScheme.outline,
                        fontWeight: entry.key == stepIndex
                            ? FontWeight.w700
                            : FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 22),
              const CircleAvatar(
                radius: 40,
                backgroundColor: Voxelith.cream,
                child: Text(
                  'M',
                  style: TextStyle(
                    fontSize: 28,
                    color: Voxelith.forest,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                speech.usingNeuralVoice
                    ? 'Maya · Neural'
                    : i18n.mayaDeviceVoice,
                style: const TextStyle(color: Voxelith.terrSoft),
              ),
              const SizedBox(height: 18),
              Text(
                scene.turnPromptFor(
                  turn.clamp(0, scene.turns.length - 1),
                  ref.watch(sessionProvider).uiLang,
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 12),
              Directionality(
                textDirection: scene.lang.isRtl
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                child: Text(
                  currentTurn.expected,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Voxelith.cream,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    height: 1.3,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                currentPhrase.glossFor(p.uiLang),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              if (LanguageGuide.of(scene.lang).tipFor(currentTurn.expected) !=
                  null) ...[
                const SizedBox(height: 14),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Voxelith.mintDark,
                    borderRadius: BorderRadius.circular(Voxelith.radius),
                  ),
                  child: Text(
                    () {
                      final guide = LanguageGuide.of(scene.lang);
                      final tip = guide.tipFor(currentTurn.expected)!;
                      final ui = ref.watch(sessionProvider).uiLang;
                      // Okunuşlar Türkçe yazımla yazılı; diğer diller için
                      // içerik çeviri hattından gelir, yoksa gösterilmez.
                      final base =
                          'gd.${scene.lang.name}.${guide.rules.indexOf(tip)}';
                      final heard = ui == UiLang.tr
                          ? tip.heard
                          : ContentOverlay.lookup('$base.h', ui);
                      final said = ui == UiLang.tr
                          ? tip.exampleSaid
                          : ContentOverlay.lookup('$base.x', ui);
                      return [
                        heard == null
                            ? tip.written
                            : '${tip.written}  →  $heard',
                        said == null ? tip.example : '${tip.example}  ≈  $said',
                      ].join('\n');
                    }(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Voxelith.terrSoft,
                      height: 1.35,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
              if (turn == 0 && scene.grammarNote != null) ...[
                const SizedBox(height: 14),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Voxelith.forest,
                    borderRadius: BorderRadius.circular(Voxelith.radius),
                    border: Border.all(color: Voxelith.gold, width: 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.school_outlined,
                            size: 15,
                            color: Voxelith.gold,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            i18n.unitRule,
                            style: const TextStyle(
                              color: Voxelith.gold,
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        scene.grammarNote!.ruleFor(
                          p.uiLang,
                          scenarioId: scene.id,
                        ),
                        style: const TextStyle(
                          color: Voxelith.cream,
                          fontSize: 13,
                          height: 1.35,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        '✓ ${scene.grammarNote!.goodExample}',
                        style: const TextStyle(
                          color: Voxelith.mintDark,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        '✗ ${scene.grammarNote!.badExample}',
                        style: TextStyle(
                          color: Voxelith.coral.withValues(alpha: 0.85),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              const Spacer(),
              if (step == _Step.fix) ...[
                VoxelithMascot(
                  size: 64,
                  mood: score >= 70
                      ? MascotMood.celebrate
                      : MascotMood.encourage,
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: [
                    _chip('${i18n.scoreOverall} $score'),
                    _chip('${i18n.scorePhoneme} $phonemeScore'),
                    _chip('${i18n.scoreFluency} $fluencyScore'),
                    _chip('${i18n.scoreClarity} $clarityScore'),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  pronunciationFeedback,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                if (Features.paidCloudApis &&
                    score > 0 &&
                    heard.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  TextButton.icon(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => AiFeedbackScreen(
                          expectedText: currentTurn.expected,
                          userText: heard,
                          targetLang: scene.lang.code,
                          nativeLang: p.uiLang.code,
                        ),
                      ),
                    ),
                    icon: const Icon(Icons.psychology_outlined, size: 18),
                    label: Text(i18n.detailedAiAnalysis),
                    style: TextButton.styleFrom(foregroundColor: Voxelith.gold),
                  ),
                ],
                const SizedBox(height: 12),
                FilledButton(
                  style: FilledButton.styleFrom(backgroundColor: Voxelith.terr),
                  onPressed: score == 0 ? _retrySpeak : _nextTurn,
                  child: Text(
                    score == 0
                        ? i18n.retryCta
                        : (turn < scene.turns.length - 1
                              ? i18n.continueCta
                              : i18n.commonFinish),
                  ),
                ),
              ] else if (step == _Step.speak) ...[
                GestureDetector(
                  onLongPressStart: (_) => _down(),
                  onLongPressEnd: (_) => _up(),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 160),
                    width: holding ? 96 : 84,
                    height: holding ? 96 : 84,
                    decoration: BoxDecoration(
                      color: Voxelith.cream,
                      shape: BoxShape.circle,
                      border: Border.all(color: Voxelith.terr, width: 4),
                      boxShadow: holding
                          ? [
                              BoxShadow(
                                color: Voxelith.terr.withValues(alpha: 0.45),
                                blurRadius: 24,
                              ),
                            ]
                          : null,
                    ),
                    child: Icon(
                      Icons.mic,
                      color: Voxelith.terr,
                      size: holding ? 38 : 32,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  holding
                      ? i18n.listeningNow(holdSec)
                      : (_speechReady
                            ? i18n.holdToSpeak
                            : i18n.holdMicPermission),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                if (heard.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Directionality(
                      textDirection: scene.lang.isRtl
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      child: Text(
                        heard,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
              ] else
                FilledButton(
                  style: FilledButton.styleFrom(backgroundColor: Voxelith.terr),
                  onPressed: () async {
                    if (step == _Step.hear) {
                      final usedPremium = await PremiumTtsService.speak(
                        currentTurn.expected,
                        lang: scene.lang.code,
                      );
                      if (usedPremium) {
                        await PremiumTtsService.waitUntilDone();
                      } else {
                        await speech.speakTarget(
                          currentTurn.expected,
                          scene.lang.code,
                        );
                      }
                    }
                    _nextStep();
                  },
                  child: Text(
                    step == _Step.hear ? i18n.listenHeard : i18n.shadowedIt,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _chip(String s) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Voxelith.mintDark,
        borderRadius: BorderRadius.circular(Voxelith.radius),
      ),
      child: Text(
        s,
        style: const TextStyle(color: Voxelith.cream, fontSize: 12),
      ),
    );
  }
}
