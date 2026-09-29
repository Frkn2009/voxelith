import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/l10n/i18n.dart';
import '../../core/l10n/i18n_ui.dart';
import '../../core/theme/tokens.dart';
import '../../data/ads/ad_service.dart';
import '../../data/content/catalog.dart';
import '../../data/models/models.dart';
import '../../data/speech/speech_controller.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';

class GamesScreen extends ConsumerWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(sessionProvider);
    final i18n = ref.watch(i18nProvider);
    Future<int> completeGame(int correct, int total) async {
      final earned = await ref
          .read(sessionProvider.notifier)
          .completeGame(correct, total);
      final latest = ref.read(sessionProvider);
      if (latest.canShowInterstitial() && await AdService.showInterstitial()) {
        await ref.read(sessionProvider.notifier).recordInterstitial();
      }
      return earned;
    }

    final games = <_GameDefinition>[
      _GameDefinition(
        i18n.gameTrueFalse,
        i18n.gameTrueFalseDesc,
        Icons.rule_rounded,
        Voxelith.mint,
        () => TrueFalseGameScreen(
          lang: profile.learnLang,
          ui: profile.uiLang,
          cefr: profile.cefr,
          onComplete: completeGame,
        ),
      ),
      _GameDefinition(
        i18n.gameLetterOrder,
        i18n.gameLetterOrderDesc,
        Icons.sort_by_alpha_rounded,
        Voxelith.sky,
        () => LetterOrderGameScreen(
          lang: profile.learnLang,
          ui: profile.uiLang,
          cefr: profile.cefr,
          onComplete: completeGame,
        ),
      ),
      _GameDefinition(
        i18n.gameAudioPuzzle,
        i18n.gameAudioPuzzleDesc,
        Icons.headphones_rounded,
        Voxelith.lavender,
        () => AudioPuzzleScreen(
          lang: profile.learnLang,
          ui: profile.uiLang,
          cefr: profile.cefr,
          onComplete: completeGame,
        ),
      ),
      _GameDefinition(
        i18n.gameFillBlank,
        i18n.gameFillBlankDesc,
        Icons.edit_note_rounded,
        Voxelith.coral,
        () => FillBlankGameScreen(
          lang: profile.learnLang,
          ui: profile.uiLang,
          cefr: profile.cefr,
          onComplete: completeGame,
        ),
      ),
      _GameDefinition(
        i18n.gameTimed,
        i18n.gameTimedDesc,
        Icons.timer_outlined,
        Voxelith.sunflower,
        () => TimedGameScreen(
          lang: profile.learnLang,
          ui: profile.uiLang,
          cefr: profile.cefr,
          onComplete: completeGame,
        ),
      ),
    ];

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(22, 16, 22, 28),
        children: [
          Text(
            i18n.gamesTitle,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 5),
          Text(
            '${profile.learnLang.flag()} ${profile.learnLang.label(profile.uiLang)} · ${i18n.gamesSubtitleCount}',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 20),
          for (final game in games) ...[
            _GameCard(definition: game),
            const SizedBox(height: 10),
          ],
        ],
      ),
    );
  }
}

class _GameDefinition {
  const _GameDefinition(
    this.title,
    this.subtitle,
    this.icon,
    this.color,
    this.screen,
  );
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Widget Function() screen;
}

class _GameCard extends StatelessWidget {
  const _GameCard({required this.definition});
  final _GameDefinition definition;

  @override
  Widget build(BuildContext context) => VoxelithCard(
    onTap: () => Navigator.of(
      context,
      rootNavigator: true,
    ).push(MaterialPageRoute<void>(builder: (_) => definition.screen())),
    child: Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: definition.color.withValues(alpha: .12),
            borderRadius: BorderRadius.circular(Voxelith.radius),
          ),
          child: Icon(definition.icon, color: definition.color),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                definition.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                definition.subtitle,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        Icon(Icons.chevron_right, color: Theme.of(context).colorScheme.outline),
      ],
    ),
  );
}

class TrueFalseGameScreen extends StatefulWidget {
  const TrueFalseGameScreen({
    super.key,
    required this.lang,
    required this.ui,
    required this.cefr,
    required this.onComplete,
  });
  final LearnLang lang;
  final UiLang ui;
  final Cefr cefr;
  final Future<int> Function(int correct, int total) onComplete;

  @override
  State<TrueFalseGameScreen> createState() => _TrueFalseGameScreenState();
}

class _TrueFalseGameScreenState extends State<TrueFalseGameScreen> {
  I18n get _i18n => I18n(widget.ui);

  final random = Random();
  late final List<Phrase> deck;
  int round = 0;
  int correct = 0;
  late Phrase phrase;
  late String proposed;
  late bool statementIsTrue;
  bool answered = false;
  bool lastRight = false;

  @override
  void initState() {
    super.initState();
    deck = Catalog.allPhrases(widget.lang, maxLevel: widget.cefr)
      ..shuffle(random);
    _prepare();
  }

  void _prepare() {
    phrase = deck[round % deck.length];
    statementIsTrue = random.nextBool();
    proposed = statementIsTrue
        ? phrase.glossFor(widget.ui)
        : _differentPhrases(deck, phrase, 1, random).first.glossFor(widget.ui);
    answered = false;
  }

  void _answer(bool choice) {
    if (answered) return;
    final right = choice == statementIsTrue;
    setState(() {
      answered = true;
      lastRight = right;
      if (right) correct++;
    });
    Future<void>.delayed(const Duration(milliseconds: 650), () {
      if (!mounted) return;
      if (round == 9) {
        showGameResult(
          context,
          i18n: _i18n,
          title: _i18n.gameTrueFalse,
          correct: correct,
          total: 10,
          onComplete: widget.onComplete,
        );
      } else {
        setState(() {
          round++;
          _prepare();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) => _GameScaffold(
    title: _i18n.gameTrueFalse,
    progress: (round + 1) / 10,
    child: Column(
      children: [
        Text(
          _i18n.gameIsTranslationRight,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 24),
        _PromptCard(
          primary: phrase.target,
          secondary: proposed,
          textDirection: widget.lang.isRtl
              ? TextDirection.rtl
              : TextDirection.ltr,
        ),
        const Spacer(),
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: answered ? null : () => _answer(false),
                icon: const Icon(Icons.close_rounded),
                label: Text(_i18n.gameFalse),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: FilledButton.icon(
                onPressed: answered ? null : () => _answer(true),
                icon: const Icon(Icons.check_rounded),
                label: Text(_i18n.gameTrue),
              ),
            ),
          ],
        ),
        if (answered) ...[
          const SizedBox(height: 12),
          MascotFeedback(
            correct: lastRight,
            message: lastRight
                ? _i18n.gameRightCall
                : _i18n.gameCorrectIs(phrase.glossFor(widget.ui)),
          ),
        ],
      ],
    ),
  );
}

class LetterOrderGameScreen extends StatefulWidget {
  const LetterOrderGameScreen({
    super.key,
    required this.lang,
    required this.ui,
    required this.cefr,
    required this.onComplete,
  });
  final LearnLang lang;
  final UiLang ui;
  final Cefr cefr;
  final Future<int> Function(int correct, int total) onComplete;

  @override
  State<LetterOrderGameScreen> createState() => _LetterOrderGameScreenState();
}

class _LetterOrderGameScreenState extends State<LetterOrderGameScreen> {
  I18n get _i18n => I18n(widget.ui);

  final random = Random();
  late final List<Phrase> deck;
  int round = 0;
  int correct = 0;
  late Phrase phrase;
  late List<_LetterTile> available;
  final selected = <_LetterTile>[];

  @override
  void initState() {
    super.initState();
    deck = Catalog.allPhrases(widget.lang, maxLevel: widget.cefr)
      ..shuffle(random);
    _prepare();
  }

  void _prepare() {
    phrase = deck[round % deck.length];
    final word = _practiceWord(phrase.target);
    final characters = word.characters.toList();
    available = [
      for (var i = 0; i < characters.length; i++) _LetterTile(i, characters[i]),
    ]..shuffle(random);
    selected.clear();
  }

  void _pick(_LetterTile tile) => setState(() {
    available.remove(tile);
    selected.add(tile);
  });

  void _undo(_LetterTile tile) => setState(() {
    selected.remove(tile);
    available.add(tile);
  });

  void _check() {
    final answer = selected.map((tile) => tile.character).join();
    final expected = _practiceWord(phrase.target);
    final right = _norm(answer) == _norm(expected);
    if (right) correct++;
    if (round == 4) {
      showGameResult(
        context,
        i18n: _i18n,
        title: _i18n.gameLetterOrder,
        correct: correct,
        total: 5,
        onComplete: widget.onComplete,
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: MascotFeedback(
          correct: right,
          message: right
              ? _i18n.correctExclaim
              : '${_i18n.retryCta} · $expected',
        ),
      ),
    );
    setState(() {
      round++;
      _prepare();
    });
  }

  @override
  Widget build(BuildContext context) {
    final expectedLength = _practiceWord(phrase.target).characters.length;
    return _GameScaffold(
      title: _i18n.gameLetterOrder,
      progress: (round + 1) / 5,
      child: Column(
        children: [
          Text(
            phrase.glossFor(widget.ui),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 26),
          Container(
            width: double.infinity,
            constraints: const BoxConstraints(minHeight: 72),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Voxelith.mintLight,
              borderRadius: BorderRadius.circular(Voxelith.radius),
              border: Border.all(color: Voxelith.mint),
            ),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 6,
              runSpacing: 6,
              children: [
                for (final tile in selected)
                  _letter(tile, () => _undo(tile), true),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final tile in available)
                _letter(tile, () => _pick(tile), false),
            ],
          ),
          const Spacer(),
          FilledButton(
            onPressed: selected.length == expectedLength ? _check : null,
            child: Text(_i18n.checkCta),
          ),
        ],
      ),
    );
  }

  Widget _letter(_LetterTile tile, VoidCallback tap, bool selectedTile) =>
      Material(
        color: selectedTile ? Voxelith.mintDark : Colors.white,
        borderRadius: BorderRadius.circular(Voxelith.radiusSm),
        child: InkWell(
          onTap: tap,
          borderRadius: BorderRadius.circular(Voxelith.radiusSm),
          child: Container(
            constraints: const BoxConstraints(minWidth: 42, minHeight: 44),
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              tile.character,
              style: TextStyle(
                color: selectedTile
                    ? Colors.white
                    : Theme.of(context).colorScheme.onSurface,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      );
}

class _LetterTile {
  const _LetterTile(this.id, this.character);
  final int id;
  final String character;
}

class AudioPuzzleScreen extends StatefulWidget {
  const AudioPuzzleScreen({
    super.key,
    required this.lang,
    required this.ui,
    required this.cefr,
    required this.onComplete,
  });
  final LearnLang lang;
  final UiLang ui;
  final Cefr cefr;
  final Future<int> Function(int correct, int total) onComplete;

  @override
  State<AudioPuzzleScreen> createState() => _AudioPuzzleScreenState();
}

class _AudioPuzzleScreenState extends State<AudioPuzzleScreen> {
  I18n get _i18n => I18n(widget.ui);

  final random = Random();
  final speech = SpeechController();
  late final List<Phrase> deck;
  int round = 0;
  int correct = 0;
  late Phrase phrase;
  late List<Phrase> options;
  bool answered = false;
  bool lastRight = false;

  @override
  void initState() {
    super.initState();
    deck = Catalog.allPhrases(widget.lang, maxLevel: widget.cefr)
      ..shuffle(random);
    _prepare();
  }

  void _prepare() {
    phrase = deck[round % deck.length];
    options = [phrase, ..._differentPhrases(deck, phrase, 3, random)]
      ..shuffle(random);
    answered = false;
  }

  Future<void> _play() => speech.speakTarget(phrase.target, widget.lang.code);

  void _answer(Phrase choice) {
    if (answered) return;
    final right = choice.id == phrase.id;
    setState(() {
      answered = true;
      lastRight = right;
      if (right) correct++;
    });
    Future<void>.delayed(const Duration(milliseconds: 750), () {
      if (!mounted) return;
      if (round == 9) {
        showGameResult(
          context,
          i18n: _i18n,
          title: _i18n.gameAudioPuzzle,
          correct: correct,
          total: 10,
          onComplete: widget.onComplete,
        );
      } else {
        setState(() {
          round++;
          _prepare();
        });
      }
    });
  }

  @override
  void dispose() {
    speech.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _GameScaffold(
    title: _i18n.gameAudioPuzzle,
    progress: (round + 1) / 10,
    child: Column(
      children: [
        Text(
          _i18n.gameListenPick,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 24),
        Semantics(
          button: true,
          label: _i18n.playAudio,
          child: InkWell(
            onTap: _play,
            borderRadius: BorderRadius.circular(Voxelith.radiusLg),
            child: Container(
              width: 112,
              height: 112,
              decoration: const BoxDecoration(
                color: Voxelith.mintDark,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.volume_up_rounded,
                color: Colors.white,
                size: 46,
              ),
            ),
          ),
        ),
        const Spacer(),
        for (final option in options)
          Padding(
            padding: const EdgeInsets.only(bottom: 9),
            child: OutlinedButton(
              onPressed: answered ? null : () => _answer(option),
              child: Text(
                option.glossFor(widget.ui),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        if (answered)
          MascotFeedback(
            correct: lastRight,
            message: lastRight
                ? _i18n.gameGreatListening
                : _i18n.gameListeningEncourage,
          ),
      ],
    ),
  );
}

class FillBlankGameScreen extends StatefulWidget {
  const FillBlankGameScreen({
    super.key,
    required this.lang,
    required this.ui,
    required this.cefr,
    required this.onComplete,
  });
  final LearnLang lang;
  final UiLang ui;
  final Cefr cefr;
  final Future<int> Function(int correct, int total) onComplete;

  @override
  State<FillBlankGameScreen> createState() => _FillBlankGameScreenState();
}

class _FillBlankGameScreenState extends State<FillBlankGameScreen> {
  I18n get _i18n => I18n(widget.ui);

  final controller = TextEditingController();
  late final List<Phrase> deck;
  int round = 0;
  int correct = 0;
  late Phrase phrase;
  late String answer;
  late String question;

  @override
  void initState() {
    super.initState();
    deck = Catalog.allPhrases(widget.lang, maxLevel: widget.cefr)
      ..shuffle(Random());
    _prepare();
  }

  void _prepare() {
    phrase = deck[round % deck.length];
    final words = phrase.target.trim().split(RegExp(r'\s+'));
    if (words.length > 1) {
      final index = words.length ~/ 2;
      answer = words[index].replaceAll(
        RegExp(r'[^\p{L}\p{M}\p{N}]', unicode: true),
        '',
      );
      words[index] = '_____';
      question = words.join(' ');
    } else {
      final characters = phrase.target.characters.toList();
      final index = characters.length ~/ 2;
      answer = characters[index];
      characters[index] = '_';
      question = characters.join();
    }
    controller.clear();
  }

  void _check() {
    final right = _norm(controller.text) == _norm(answer);
    if (right) correct++;
    if (round == 4) {
      showGameResult(
        context,
        i18n: _i18n,
        title: _i18n.gameFillBlank,
        correct: correct,
        total: 5,
        onComplete: widget.onComplete,
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: MascotFeedback(
          correct: right,
          message: right ? _i18n.correctExclaim : '${_i18n.retryCta} · $answer',
        ),
      ),
    );
    setState(() {
      round++;
      _prepare();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _GameScaffold(
    title: _i18n.gameFillBlank,
    progress: (round + 1) / 5,
    child: Column(
      children: [
        Text(
          phrase.glossFor(widget.ui),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 26),
        _PromptCard(
          primary: question,
          textDirection: widget.lang.isRtl
              ? TextDirection.rtl
              : TextDirection.ltr,
        ),
        const SizedBox(height: 22),
        TextField(
          controller: controller,
          textAlign: TextAlign.center,
          autocorrect: false,
          onSubmitted: (_) => _check(),
          decoration: InputDecoration(hintText: _i18n.missingWordHint),
        ),
        const Spacer(),
        FilledButton(onPressed: _check, child: Text(_i18n.checkCta)),
      ],
    ),
  );
}

class TimedGameScreen extends StatefulWidget {
  const TimedGameScreen({
    super.key,
    required this.lang,
    required this.ui,
    required this.cefr,
    required this.onComplete,
  });
  final LearnLang lang;
  final UiLang ui;
  final Cefr cefr;
  final Future<int> Function(int correct, int total) onComplete;

  @override
  State<TimedGameScreen> createState() => _TimedGameScreenState();
}

class _TimedGameScreenState extends State<TimedGameScreen> {
  I18n get _i18n => I18n(widget.ui);

  final random = Random();
  late final List<Phrase> deck;
  Timer? timer;
  int seconds = 60;
  int total = 0;
  int correct = 0;
  late Phrase phrase;
  late List<Phrase> options;

  @override
  void initState() {
    super.initState();
    deck = Catalog.allPhrases(widget.lang, maxLevel: widget.cefr)
      ..shuffle(random);
    _prepare();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      if (seconds <= 1) {
        timer?.cancel();
        setState(() => seconds = 0);
        showGameResult(
          context,
          i18n: _i18n,
          title: _i18n.gameTimed,
          correct: correct,
          total: total,
          onComplete: widget.onComplete,
        );
      } else {
        setState(() => seconds--);
      }
    });
  }

  void _prepare() {
    phrase = deck[total % deck.length];
    options = [phrase, ..._differentPhrases(deck, phrase, 3, random)]
      ..shuffle(random);
  }

  void _answer(Phrase choice) {
    if (seconds == 0) return;
    setState(() {
      total++;
      if (choice.id == phrase.id) correct++;
      _prepare();
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _GameScaffold(
    title: '${_i18n.gameTimed} · ${seconds}s',
    progress: seconds / 60,
    trailing: _i18n.gameCorrectCount(correct),
    child: Column(
      children: [
        Text(
          _i18n.gamePickCorrectTranslation,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 24),
        _PromptCard(
          primary: phrase.target,
          textDirection: widget.lang.isRtl
              ? TextDirection.rtl
              : TextDirection.ltr,
        ),
        const Spacer(),
        for (final option in options)
          Padding(
            padding: const EdgeInsets.only(bottom: 9),
            child: OutlinedButton(
              onPressed: () => _answer(option),
              child: Text(
                option.glossFor(widget.ui),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    ),
  );
}

class _GameScaffold extends StatelessWidget {
  const _GameScaffold({
    required this.title,
    required this.progress,
    required this.child,
    this.trailing,
  });
  final String title;
  final double progress;
  final String? trailing;
  final Widget child;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: VoxelithAppBar(
      pageTitle: Text(title),
      actions: trailing == null
          ? null
          : [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Center(child: Text(trailing!)),
              ),
            ],
    ),
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(22, 8, 22, 22),
        child: Column(
          children: [
            LinearProgressIndicator(value: progress.clamp(0, 1).toDouble()),
            const SizedBox(height: 22),
            Expanded(child: child),
          ],
        ),
      ),
    ),
  );
}

class _PromptCard extends StatelessWidget {
  const _PromptCard({
    required this.primary,
    this.secondary,
    this.textDirection = TextDirection.ltr,
  });
  final String primary;
  final String? secondary;
  final TextDirection textDirection;

  @override
  Widget build(BuildContext context) => VoxelithCard(
    color: Voxelith.mintLight,
    child: Column(
      children: [
        Directionality(
          textDirection: textDirection,
          child: Text(
            primary,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 23,
              height: 1.3,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
        if (secondary != null) ...[
          const SizedBox(height: 14),
          const Divider(),
          const SizedBox(height: 8),
          Text(
            secondary!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              height: 1.35,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ],
    ),
  );
}

Future<void> showGameResult(
  BuildContext context, {
  required I18n i18n,
  required String title,
  required int correct,
  required int total,
  required Future<int> Function(int correct, int total) onComplete,
}) async {
  final earnedXp = await onComplete(correct, total);
  if (!context.mounted) return;
  final safeTotal = max(total, 1);
  final percent = (correct * 100 / safeTotal).round();
  await showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) => AlertDialog(
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          VoxelithMascot(
            size: 76,
            mood: percent >= 70 ? MascotMood.celebrate : MascotMood.encourage,
          ),
          const SizedBox(height: 6),
          Text(
            '$percent%',
            style: const TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.w700,
              color: Voxelith.mintDark,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            i18n.gameCorrectOfTotal(correct, total),
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '+$earnedXp XP',
            style: const TextStyle(
              color: Voxelith.sunflower,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      actions: [
        FilledButton(
          onPressed: () {
            Navigator.of(dialogContext).pop();
            Navigator.of(context).pop();
          },
          child: Text(i18n.commonOk),
        ),
      ],
    ),
  );
}

List<Phrase> _differentPhrases(
  List<Phrase> source,
  Phrase current,
  int count,
  Random random,
) {
  final candidates = source.where((phrase) => phrase.id != current.id).toList()
    ..shuffle(random);
  final unique = <String>{};
  final result = <Phrase>[];
  for (final phrase in candidates) {
    if (unique.add(phrase.target)) result.add(phrase);
    if (result.length == count) break;
  }
  return result;
}

String _practiceWord(String value) {
  final words = value
      .split(RegExp(r'\s+'))
      .map(
        (word) =>
            word.replaceAll(RegExp(r'[^\p{L}\p{M}\p{N}]', unicode: true), ''),
      )
      .where(
        (word) => word.characters.length >= 2 && word.characters.length <= 12,
      )
      .toList();
  if (words.isNotEmpty) return words.first;
  final clean = value.replaceAll(
    RegExp(r'[^\p{L}\p{M}\p{N}]', unicode: true),
    '',
  );
  return clean.characters.take(12).join();
}

String _norm(String value) => value
    .toLowerCase()
    .replaceAll(RegExp(r'[^\p{L}\p{M}\p{N}]', unicode: true), '')
    .trim();
