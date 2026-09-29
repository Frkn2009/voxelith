import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../core/theme/tokens.dart';

enum MascotMood { neutral, wave, celebrate, encourage, streak }

/// VOXELITH'nın özgün “Voxelith” karakteri: konuşma ışığını taşıyan küçük rehber.
/// Harici görsel kullanmaz; tüm şekiller Flutter Canvas ile çizilir.
class VoxelithMascot extends StatefulWidget {
  const VoxelithMascot({
    super.key,
    this.size = 96,
    this.mood = MascotMood.neutral,
    this.animate = true,
  });

  final double size;
  final MascotMood mood;
  final bool animate;

  @override
  State<VoxelithMascot> createState() => _VoxelithMascotState();
}

class _VoxelithMascotState extends State<VoxelithMascot>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );
    if (widget.animate) controller.repeat();
  }

  @override
  void didUpdateWidget(covariant VoxelithMascot oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animate && !controller.isAnimating) controller.repeat();
    if (!widget.animate && controller.isAnimating) controller.stop();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Semantics(
    // Marka/maskot adı; dil bağımsız (bu widget ProviderScope dışında da
    // kullanılabildiği için I18n'e bağlanmadı).
    label: 'Voxelith',
    image: true,
    child: AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final phase = widget.animate ? controller.value * math.pi * 2 : 0.0;
        final lift =
            math.sin(phase) * (widget.mood == MascotMood.celebrate ? 4 : 2);
        final tilt = widget.mood == MascotMood.wave
            ? math.sin(phase) * .035
            : 0.0;
        return Transform.translate(
          offset: Offset(0, lift),
          child: Transform.rotate(
            angle: tilt,
            child: CustomPaint(
              size: Size.square(widget.size),
              painter: _VoxelithMascotPainter(mood: widget.mood, phase: phase),
            ),
          ),
        );
      },
    ),
  );
}

class _VoxelithMascotPainter extends CustomPainter {
  const _VoxelithMascotPainter({required this.mood, required this.phase});
  final MascotMood mood;
  final double phase;

  @override
  void paint(Canvas canvas, Size size) {
    final unit = size.width / 100;
    Offset p(double x, double y) => Offset(x * unit, y * unit);
    final stroke = Paint()
      ..color = Voxelith.ink
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.2 * unit
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    // Anten: konuşma sinyalini taşıyan mercan ışık.
    canvas.drawLine(p(50, 19), p(50, 10), stroke);
    canvas.drawCircle(p(50, 7), 5.5 * unit, Paint()..color = Voxelith.coral);
    if (mood == MascotMood.streak) {
      final glow = Paint()..color = Voxelith.sunflower.withValues(alpha: .25);
      canvas.drawCircle(p(50, 7), (10 + math.sin(phase) * 2) * unit, glow);
    }

    // Kulak/ses kanatları.
    final side = Paint()..color = Voxelith.mint;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: p(16, 46), width: 14 * unit, height: 28 * unit),
        Radius.circular(7 * unit),
      ),
      side,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: p(84, 46), width: 14 * unit, height: 28 * unit),
        Radius.circular(7 * unit),
      ),
      side,
    );

    final bodyRect = Rect.fromLTWH(20 * unit, 20 * unit, 60 * unit, 66 * unit);
    canvas.drawRRect(
      RRect.fromRectAndRadius(bodyRect, Radius.circular(22 * unit)),
      Paint()..color = Voxelith.mintDark,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(28 * unit, 30 * unit, 44 * unit, 35 * unit),
        Radius.circular(15 * unit),
      ),
      Paint()..color = Voxelith.white,
    );

    // Gözler ve ifade.
    final eye = Paint()
      ..color = Voxelith.ink
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.3 * unit
      ..strokeCap = StrokeCap.round;
    if (mood == MascotMood.celebrate) {
      canvas.drawArc(
        Rect.fromCenter(center: p(40, 45), width: 10 * unit, height: 8 * unit),
        math.pi,
        math.pi,
        false,
        eye,
      );
      canvas.drawArc(
        Rect.fromCenter(center: p(60, 45), width: 10 * unit, height: 8 * unit),
        math.pi,
        math.pi,
        false,
        eye,
      );
    } else {
      canvas.drawCircle(p(40, 45), 2.2 * unit, Paint()..color = Voxelith.ink);
      canvas.drawCircle(p(60, 45), 2.2 * unit, Paint()..color = Voxelith.ink);
      if (mood == MascotMood.encourage) {
        canvas.drawLine(p(55, 38), p(65, 40), eye);
      }
    }
    final smileStart = mood == MascotMood.encourage ? .05 : .12;
    canvas.drawArc(
      Rect.fromCenter(center: p(50, 51), width: 16 * unit, height: 13 * unit),
      smileStart,
      math.pi - smileStart * 2,
      false,
      eye,
    );

    // Göğüsteki VOXELITH konuşma kıvılcımı.
    final spark = Path()
      ..moveTo(42 * unit, 75 * unit)
      ..lineTo(48 * unit, 69 * unit)
      ..lineTo(54 * unit, 75 * unit)
      ..lineTo(60 * unit, 69 * unit);
    canvas.drawPath(
      spark,
      Paint()
        ..color = Voxelith.peach
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3 * unit
        ..strokeCap = StrokeCap.round,
    );

    // Ayaklar ve selam kolu.
    canvas.drawLine(p(37, 86), p(34, 94), stroke);
    canvas.drawLine(p(63, 86), p(66, 94), stroke);
    canvas.drawLine(p(30, 94), p(38, 94), stroke);
    canvas.drawLine(p(62, 94), p(70, 94), stroke);
    if (mood == MascotMood.wave || mood == MascotMood.celebrate) {
      final handY = mood == MascotMood.celebrate
          ? 24.0
          : 31.0 + math.sin(phase) * 3;
      canvas.drawLine(p(79, 62), p(91, handY), stroke);
      canvas.drawCircle(
        p(92, handY - 2),
        3 * unit,
        Paint()..color = Voxelith.coral,
      );
    } else {
      canvas.drawLine(p(79, 60), p(88, 69), stroke);
    }
  }

  @override
  bool shouldRepaint(covariant _VoxelithMascotPainter oldDelegate) =>
      oldDelegate.mood != mood || oldDelegate.phase != phase;
}

class MascotFeedback extends StatelessWidget {
  const MascotFeedback({
    super.key,
    required this.correct,
    required this.message,
  });
  final bool correct;
  final String message;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      VoxelithMascot(
        size: 46,
        mood: correct ? MascotMood.celebrate : MascotMood.encourage,
      ),
      const SizedBox(width: 8),
      Flexible(
        child: Text(
          message,
          style: TextStyle(
            color: correct ? Voxelith.mintDark : Voxelith.coral,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ],
  );
}
