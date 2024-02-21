import 'package:flutter/material.dart';

class LevelMapPage extends StatefulWidget {
  @override
  _LevelMapPageState createState() => _LevelMapPageState();
}

class _LevelMapPageState extends State<LevelMapPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LevelMapPainter(animation: _animation),
      child: Container(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class LevelMapPainter extends CustomPainter {
  final Animation<double> animation;

  LevelMapPainter({required this.animation}) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;

    var path = Path();
    path.moveTo(size.width * 0.1, size.height * 0.5);
    path.lineTo(size.width * 0.9, size.height * 0.5);
    canvas.drawPath(path, paint);

    for (int i = 1; i <= 5; i++) {
      double x = size.width * i / 6;
      double y = size.height * 0.5;
      double radius = 20 + (10 * animation.value);
      canvas.drawCircle(Offset(x, y), radius, paint);
      TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: '$i',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(canvas,
          Offset(x - textPainter.width / 2, y - textPainter.height / 2));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
