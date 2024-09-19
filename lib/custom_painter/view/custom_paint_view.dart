import 'package:flutter/material.dart';

class CustomPaintView extends StatelessWidget {
  const CustomPaintView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.black,
          child: CustomPaint(
            size: const Size(300, 300),
            painter: MyCustomPainter(),
          ),
        ),
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 10;
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 40, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
