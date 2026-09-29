import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/l10n/i18n.dart';
import '../../core/l10n/i18n_ui.dart';
import '../../core/theme/tokens.dart';
import '../../data/content/clips.dart';
import '../../data/models/models.dart';
import '../../data/speech/speech_controller.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';

class ClipsScreen extends ConsumerStatefulWidget {
  const ClipsScreen({super.key});

  @override
  ConsumerState<ClipsScreen> createState() => _ClipsScreenState();
}

class _ClipsScreenState extends ConsumerState<ClipsScreen> {
  final speech = SpeechController();
  Timer? playbackTimer;
  int index = 0;
  String? playingId;
  bool shadowMode = false;

  static const gradients = <List<Color>>[
    [Color(0xFF123B3A), Color(0xFF1A9E92)],
    [Color(0xFF263653), Color(0xFF506A96)],
    [Color(0xFF49345F), Color(0xFF8462A8)],
    [Color(0xFF593B35), Color(0xFFB66A58)],
  ];

  @override
  void dispose() {
    playbackTimer?.cancel();
    speech.dispose();
    super.dispose();
  }

  Future<void> _play(
    LearningClip clip, {
    required bool slow,
    bool shadow = false,
  }) async {
    playbackTimer?.cancel();
    setState(() {
      playingId = clip.id;
      shadowMode = shadow;
    });
    await speech.speakTarget(
      clip.phrase.target,
      clip.scenario.lang.code,
      rate: slow ? .28 : .42,
    );
    final seconds = (clip.phrase.target.runes.length / (slow ? 7 : 11))
        .ceil()
        .clamp(2, 9)
        .toInt();
    playbackTimer = Timer(Duration(seconds: seconds), () {
      if (mounted && playingId == clip.id) {
        setState(() {
          playingId = null;
          shadowMode = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final i18n = ref.watch(i18nProvider);
    final profile = ref.watch(sessionProvider);
    final clips = ClipCatalog.forLang(profile.learnLang);

    return Scaffold(
      appBar: VoxelithAppBar(pageTitle: Text(i18n.clips)),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 12, 22, 10),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${profile.learnLang.flag()} ${profile.learnLang.label(profile.uiLang)}',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          i18n.clipsCountHint(clips.length),
                          style: const TextStyle(
                            color: Voxelith.muted,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '${index + 1} / ${clips.length}',
                    style: const TextStyle(
                      color: Voxelith.muted,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: LinearProgressIndicator(
                value: clips.isEmpty ? 0 : (index + 1) / clips.length,
                minHeight: 3,
                borderRadius: BorderRadius.circular(4),
                color: Voxelith.mint,
                backgroundColor: Voxelith.fog,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: PageView.builder(
                itemCount: clips.length,
                onPageChanged: (value) {
                  playbackTimer?.cancel();
                  speech.stopSpeak();
                  setState(() {
                    index = value;
                    playingId = null;
                    shadowMode = false;
                  });
                },
                itemBuilder: (context, clipIndex) => _clipCard(
                  context,
                  clips[clipIndex],
                  profile.uiLang,
                  i18n,
                  gradients[clipIndex % gradients.length],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _clipCard(
    BuildContext context,
    LearningClip clip,
    UiLang uiLanguage,
    I18n i18n,
    List<Color> gradient,
  ) {
    final isPlaying = playingId == clip.id;
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(22, 8, 22, 20),
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight - 28),
          child: VoxelithCard(
            padding: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Semantics(
                  button: true,
                  label: isPlaying ? i18n.pauseClip : i18n.playClip,
                  child: InkWell(
                    onTap: () {
                      if (isPlaying) {
                        speech.stopSpeak();
                        playbackTimer?.cancel();
                        setState(() {
                          playingId = null;
                          shadowMode = false;
                        });
                      } else {
                        _play(clip, slow: false);
                      }
                    },
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(Voxelith.radius),
                    ),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 240),
                      height: 200,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: gradient,
                        ),
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(Voxelith.radius),
                        ),
                      ),
                      child: Stack(
                        children: [
                          const Positioned(
                            right: -24,
                            top: -28,
                            child: _DecorativeRing(size: 130),
                          ),
                          const Positioned(
                            left: -36,
                            bottom: -58,
                            child: _DecorativeRing(size: 170),
                          ),
                          Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 180),
                                  width: isPlaying ? 76 : 68,
                                  height: isPlaying ? 76 : 68,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: .16),
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.white38),
                                  ),
                                  child: Icon(
                                    isPlaying
                                        ? Icons.graphic_eq_rounded
                                        : Icons.play_arrow_rounded,
                                    color: Colors.white,
                                    size: 38,
                                  ),
                                ),
                                const SizedBox(height: 14),
                                Text(
                                  shadowMode && isPlaying
                                      ? i18n.listenRepeatSimultaneously
                                      : clip.scenario.title(uiLanguage),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  i18n.curriculumClip(clip.position + 1),
                                  style: const TextStyle(
                                    color: Colors.white60,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 22, 20, 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Directionality(
                        textDirection: clip.scenario.lang.isRtl
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                        child: Text(
                          clip.phrase.target,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            height: 1.25,
                            color: Voxelith.ink,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        clip.phrase.glossFor(uiLanguage),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Voxelith.muted,
                        ),
                      ),
                      const SizedBox(height: 22),
                      Row(
                        children: [
                          _action(
                            icon: Icons.slow_motion_video,
                            label: i18n.slow,
                            onTap: () => _play(clip, slow: true),
                          ),
                          const SizedBox(width: 8),
                          _action(
                            icon: Icons.record_voice_over_outlined,
                            label: i18n.shadow,
                            onTap: () => _play(clip, slow: true, shadow: true),
                          ),
                          const SizedBox(width: 8),
                          _action(
                            icon: Icons.mic_none_rounded,
                            label: i18n.speak,
                            onTap: () =>
                                context.push('/session?id=${clip.scenarioId}'),
                            emphasized: true,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton.icon(
                          onPressed: () {
                            ref
                                .read(sessionProvider.notifier)
                                .learnPhrase(clip.phrase.id);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(i18n.phraseAddedToReview)),
                            );
                          },
                          icon: const Icon(Icons.bookmark_add_outlined),
                          label: Text(i18n.savePhrase),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _action({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    bool emphasized = false,
  }) {
    final background = emphasized ? Voxelith.mintDark : Voxelith.cloud;
    final foreground = emphasized ? Colors.white : Voxelith.ink;
    return Expanded(
      child: Material(
        color: background,
        borderRadius: BorderRadius.circular(Voxelith.radius),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(Voxelith.radius),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 4),
            child: Column(
              children: [
                Icon(icon, color: foreground, size: 20),
                const SizedBox(height: 5),
                Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: foreground,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DecorativeRing extends StatelessWidget {
  const _DecorativeRing({required this.size});
  final double size;

  @override
  Widget build(BuildContext context) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: Colors.white12, width: 24),
    ),
  );
}
