import 'package:flutter/material.dart';

class _HeaderCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;
    canvas.drawCircle(
      Offset(size.width * 0.25, size.height * 0.4),
      12,
      paint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.75, size.height * 0.2),
      12,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // 一度描画したら状態が変わらないので、false
    return false;
  }
}

class HeaderCircles extends StatelessWidget {
  final double height;
  const HeaderCircles({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _HeaderCirclePainter(),
      // 円を描く範囲を前もって定義
      // このBoxの中にheaderCirclePainterの中身が描かれる
      child: SizedBox(
        width: double.infinity,
        height: height,
      ),
    );
  }
}
