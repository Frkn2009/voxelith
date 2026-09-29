import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/l10n/i18n.dart';
import '../../core/l10n/i18n_ui.dart';
import '../../core/theme/tokens.dart';
import '../../state/session.dart';

/// Tek bir tanıtım turu adımı: gerçek bir ekran öğesine (GlobalKey ile)
/// bağlı bir spot ışığı + başlık/açıklama balonu.
class CoachStep {
  const CoachStep({
    required this.targetKey,
    required this.title,
    required this.body,
  });
  final GlobalKey targetKey;
  final String title;
  final String body;
}

/// Gerçek ekranlar üzerinde çalışan, arka planı karartıp hedef widget'ın
/// etrafına spot ışığı düşüren interaktif tanıtım turu. Uygulama içindeki
/// gerçek widget ağacına bağlıdır (mockup ekran değil) — [CoachStep.targetKey]
/// hangi widget'ı işaret edeceğini belirtir.
class CoachTour {
  static OverlayEntry? _entry;

  static void start(
    BuildContext context, {
    required List<CoachStep> steps,
    VoidCallback? onFinish,
  }) {
    if (steps.isEmpty) return;
    dismiss();
    final overlay = Overlay.of(context, rootOverlay: true);
    final i18n = ProviderScope.containerOf(
      context,
      listen: false,
    ).read(i18nProvider);
    _entry = OverlayEntry(
      builder: (_) => _CoachTourOverlay(
        steps: steps,
        i18n: i18n,
        onFinish: () {
          dismiss();
          onFinish?.call();
        },
      ),
    );
    overlay.insert(_entry!);
  }

  static void dismiss() {
    _entry?.remove();
    _entry = null;
  }
}

class _CoachTourOverlay extends StatefulWidget {
  const _CoachTourOverlay({
    required this.steps,
    required this.i18n,
    required this.onFinish,
  });
  final List<CoachStep> steps;
  final I18n i18n;
  final VoidCallback onFinish;

  @override
  State<_CoachTourOverlay> createState() => _CoachTourOverlayState();
}

class _CoachTourOverlayState extends State<_CoachTourOverlay> {
  int _index = 0;

  void _next() {
    if (_index >= widget.steps.length - 1) {
      widget.onFinish();
    } else {
      setState(() => _index++);
    }
  }

  Rect? _targetRect() {
    final ctx = widget.steps[_index].targetKey.currentContext;
    final box = ctx?.findRenderObject() as RenderBox?;
    if (box == null || !box.attached) return null;
    return (box.localToGlobal(Offset.zero) & box.size).inflate(8);
  }

  @override
  Widget build(BuildContext context) {
    final step = widget.steps[_index];
    final rect = _targetRect();
    final screen = MediaQuery.of(context).size;

    if (rect == null) {
      // Hedef şu an ekranda değil (örn. henüz layout olmadı veya
      // kaydırılmış) — bir sonraki adıma geç, kullanıcıyı bekletme.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _next();
      });
      return const SizedBox.shrink();
    }

    final showBelow = rect.center.dy < screen.height / 2;

    // Balonun genişliğini `Positioned(left, right)`'ın Stack'ten miras
    // aldığı örtük genişliğe bırakmak yerine burada açıkça veriyoruz:
    // bazı durumlarda üstteki root `Overlay` theatre'ı bu ağaca sınırsız
    // (infinite) genişlik constraint'i geçiriyor, bu da balonun içindeki
    // `FilledButton`'ın layout sırasında çökmesine yol açıyordu (balon
    // hiç görünmüyor, geride sadece kararmış/spot ışıklı boş bir kutu
    // kalıyordu). Açık `width` bu sınırsızlığın balona sızmasını
    // tamamen engeller.
    final balloonWidth = screen.width - 40;
    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            onTap: _next,
            child: CustomPaint(
              painter: _SpotlightPainter(rect: rect),
              size: Size.infinite,
            ),
          ),
        ),
        Positioned(
          left: 20,
          top: showBelow ? rect.bottom + 16 : null,
          bottom: showBelow ? null : screen.height - rect.top + 16,
          child: SizedBox(
            width: balloonWidth,
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Voxelith.forest,
                  borderRadius: BorderRadius.circular(Voxelith.radiusLg),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: .35),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            step.title,
                            style: const TextStyle(
                              color: Voxelith.cream,
                              fontWeight: FontWeight.w700,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        Text(
                          '${_index + 1}/${widget.steps.length}',
                          style: const TextStyle(
                            color: Voxelith.terrSoft,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      step.body,
                      style: const TextStyle(
                        color: Color(0xFFB8C8C0),
                        fontSize: 14,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _TourButton(
                          onTap: widget.onFinish,
                          label: widget.i18n.tourSkip,
                          foreground: Voxelith.terrSoft,
                        ),
                        _TourButton(
                          onTap: _next,
                          label: _index >= widget.steps.length - 1
                              ? widget.i18n.commonFinish
                              : widget.i18n.commonNext,
                          background: Voxelith.terr,
                          foreground: Voxelith.cream,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// `TextButton`/`FilledButton` yerine kasıtlı olarak burada elle çizilmiş,
/// minimal bir buton: Material'ın `ButtonStyleButton._computeSize`'ı
/// kendi içinde `maxWidth: double.infinity` olan bir `ConstrainedBox`
/// kullanıyor — bu overlay'in `Positioned`/`Stack` zincirinde nadiren
/// oluşan sınırsız genişlik constraint'iyle karşılaşınca çöküyordu (bkz.
/// yukarıdaki not). Bu basit `InkWell` + `Padding` o kod yoluna hiç
/// girmediği için aynı çökmeye açık değil.
class _TourButton extends StatelessWidget {
  const _TourButton({
    required this.onTap,
    required this.label,
    required this.foreground,
    this.background,
  });

  final VoidCallback onTap;
  final String label;
  final Color foreground;
  final Color? background;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: background ?? Colors.transparent,
      borderRadius: BorderRadius.circular(Voxelith.radiusSm),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(Voxelith.radiusSm),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Text(
            label,
            style: TextStyle(color: foreground, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}

class _SpotlightPainter extends CustomPainter {
  _SpotlightPainter({required this.rect});
  final Rect rect;

  @override
  void paint(Canvas canvas, Size size) {
    final overlayPath = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    final holePath = Path()
      ..addRRect(RRect.fromRectAndRadius(rect, const Radius.circular(16)));
    final combined = Path.combine(
      PathOperation.difference,
      overlayPath,
      holePath,
    );
    canvas.drawPath(
      combined,
      Paint()..color = Colors.black.withValues(alpha: .65),
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, const Radius.circular(16)),
      Paint()
        ..color = Voxelith.terr
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3,
    );
  }

  @override
  bool shouldRepaint(covariant _SpotlightPainter oldDelegate) =>
      oldDelegate.rect != rect;
}
