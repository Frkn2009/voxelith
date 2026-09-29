import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/l10n/i18n.dart';
import '../../core/l10n/i18n_ui.dart';
import '../../core/theme/tokens.dart';
import '../../data/models/models.dart';
import '../../data/speech/premium_tts_service.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';
import 'alphabet_engine.dart';

class AlphabetScreen extends ConsumerStatefulWidget {
  const AlphabetScreen({super.key, required this.languageCode});
  final String languageCode;

  @override
  ConsumerState<AlphabetScreen> createState() => _AlphabetScreenState();
}

class _AlphabetScreenState extends ConsumerState<AlphabetScreen> {
  late VoxelithAlphabet _alphabet;
  final Set<String> _learned = {};
  bool _stepMode = false;
  final _pageController = PageController();
  int _step = 0;

  @override
  void initState() {
    super.initState();
    _alphabet = AlphabetEngine.getAlphabet(widget.languageCode);
    AlphabetEngine.initTts();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// Örnek kelimeler için önce ElevenLabs'i dener (Plus + sunucu
  /// yapılandırılmışsa), olmazsa cihaz TTS'ine düşer. Tek harf/ses
  /// telaffuzu bu yola girmiyor — [AlphabetEngine.speak]'in yavaş/yüksek
  /// perdeli ayarı harf sesini öğretmek için özellikle ayarlanmış.
  Future<void> _speakWord(String word) async {
    final usedPremium = await PremiumTtsService.speak(
      word,
      lang: widget.languageCode,
    );
    if (!usedPremium) {
      await AlphabetEngine.speak(word, widget.languageCode);
    }
  }

  void _learnStep(String character) {
    setState(() => _learned.add(character));
    if (_step < _alphabet.letters.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  /// Alfabe verisi yalnızca TR (+ harf adı için EN) yazılı. Diğer arayüz
  /// dillerinin karşılıkları içerik çeviri hattından gelir
  /// (`assets/content/i18n/<ui>.json`, anahtar `al.<dil>.<harf>.<n|s|m>`).
  String? _overlay(VoxelithLetter letter, String field, UiLang ui) =>
      ContentOverlay.lookup(
        'al.${widget.languageCode}.${letter.character}.$field',
        ui,
      );

  /// Harf adı.
  String _letterName(VoxelithLetter letter, UiLang ui) => ui == UiLang.tr
      ? letter.nameTr
      : _overlay(letter, 'n', ui) ?? letter.nameEn;

  /// Ses ipucu — Türkçe okunuşa göre yazılmış; çevirisi yoksa gizlenir.
  String? _sound(VoxelithLetter letter, UiLang ui) =>
      ui == UiLang.tr ? letter.sound : _overlay(letter, 's', ui);

  String _nameAndSound(
    VoxelithLetter letter,
    UiLang ui, {
    bool quoted = false,
  }) {
    final sound = _sound(letter, ui);
    if (sound == null || sound.isEmpty) return _letterName(letter, ui);
    return '${_letterName(letter, ui)}  ·  ${quoted ? '"$sound"' : sound}';
  }

  /// Örnek kelime + anlamı (anlam çevirisi yoksa yalnızca kelime).
  String _example(VoxelithLetter letter, UiLang ui) {
    final meaning = ui == UiLang.tr
        ? letter.exampleMeaning
        : _overlay(letter, 'm', ui);
    return meaning == null || meaning.isEmpty
        ? letter.exampleWord
        : '${letter.exampleWord}  →  $meaning';
  }

  @override
  Widget build(BuildContext context) {
    final i18n = ref.watch(i18nProvider);
    final ui = ref.watch(sessionProvider).uiLang;
    final progress = _alphabet.letters.isEmpty
        ? 0.0
        : _learned.length / _alphabet.letters.length;

    return Scaffold(
      appBar: VoxelithAppBar(
        pageTitle: Text(
          i18n.alphabetName(widget.languageCode),
          style: const TextStyle(fontWeight: FontWeight.w800),
        ),
        actions: [
          IconButton(
            icon: Icon(
              _stepMode ? Icons.view_list : Icons.school,
              color: VoxelithTokens.accent,
            ),
            tooltip: _stepMode ? i18n.listView : i18n.stepByStepLesson,
            onPressed: () => setState(() => _stepMode = !_stepMode),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                '%${(progress * 100).toInt()}',
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  color: VoxelithTokens.primary,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: _stepMode ? _buildStepMode(i18n, ui) : _buildListMode(ui),
      ),
    );
  }

  Widget _buildStepMode(I18n i18n, UiLang ui) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: LinearProgressIndicator(
            value: _alphabet.letters.isEmpty
                ? 0
                : (_step + 1) / _alphabet.letters.length,
            minHeight: 10,
            color: VoxelithTokens.primary,
            backgroundColor: VoxelithTokens.primary.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(99),
          ),
        ),
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: _alphabet.letters.length,
            onPageChanged: (i) => setState(() => _step = i),
            itemBuilder: (context, index) {
              final letter = _alphabet.letters[index];
              final isLearned = _learned.contains(letter.character);
              return Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => AlphabetEngine.speak(
                        letter.character,
                        widget.languageCode,
                      ),
                      child: Container(
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          gradient: VoxelithTokens.heroGradient,
                          borderRadius: BorderRadius.circular(
                            VoxelithTokens.radiusLarge,
                          ),
                          boxShadow: VoxelithTokens.softShadow,
                        ),
                        child: Center(
                          child: Text(
                            letter.character,
                            style: const TextStyle(
                              fontSize: 90,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Icon(
                      Icons.volume_up,
                      color: VoxelithTokens.accent,
                      size: 28,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      _nameAndSound(letter, ui, quoted: true),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: () => _speakWord(letter.exampleWord),
                      child: Text(
                        _example(letter, ui),
                        style: const TextStyle(
                          fontSize: 18,
                          color: VoxelithTokens.textSecondary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: 240,
                      height: 56,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: VoxelithTokens.primary,
                        ),
                        icon: Icon(
                          isLearned ? Icons.check_circle : Icons.arrow_forward,
                          color: Colors.white,
                        ),
                        onPressed: () => _learnStep(letter.character),
                        label: Text(
                          index == _alphabet.letters.length - 1
                              ? i18n.commonFinish
                              : i18n.learnedNext,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildListMode(UiLang ui) {
    final progress = _alphabet.letters.isEmpty
        ? 0.0
        : _learned.length / _alphabet.letters.length;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 10,
            color: VoxelithTokens.primary,
            backgroundColor: VoxelithTokens.primary.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(99),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: _alphabet.letters.length,
            itemBuilder: (context, index) {
              final letter = _alphabet.letters[index];
              final isLearned = _learned.contains(letter.character);

              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: VoxelithTokens.surface,
                  borderRadius: BorderRadius.circular(
                    VoxelithTokens.radiusMedium,
                  ),
                  boxShadow: VoxelithTokens.softShadow,
                  border: Border.all(
                    color: isLearned
                        ? VoxelithTokens.primary
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(12),
                  onTap: () {
                    AlphabetEngine.speak(letter.character, widget.languageCode);
                  },
                  leading: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      gradient: isLearned ? VoxelithTokens.heroGradient : null,
                      color: isLearned
                          ? null
                          : VoxelithTokens.accent.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Center(
                      child: Text(
                        letter.character,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          color: isLearned
                              ? Colors.white
                              : VoxelithTokens.textPrimary,
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    _nameAndSound(letter, ui),
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    _example(letter, ui),
                    style: const TextStyle(color: VoxelithTokens.textSecondary),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.volume_up,
                          color: VoxelithTokens.accent,
                        ),
                        onPressed: () => _speakWord(letter.exampleWord),
                      ),
                      IconButton(
                        icon: Icon(
                          isLearned
                              ? Icons.check_circle
                              : Icons.circle_outlined,
                          color: isLearned
                              ? VoxelithTokens.primary
                              : VoxelithTokens.textSecondary,
                        ),
                        onPressed: () {
                          setState(() {
                            if (isLearned) {
                              _learned.remove(letter.character);
                            } else {
                              _learned.add(letter.character);
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
