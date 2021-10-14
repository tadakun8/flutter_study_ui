import 'dart:math';

import 'package:battery_optimizer/const.dart';
import 'package:flutter/material.dart';

class _BatteryLevelIndicatorPainter extends CustomPainter {
  // バッテリーレベルの割合
  final double percentage;
  // 内側に表示される白丸の半径
  final double textCircleRadius;

  _BatteryLevelIndicatorPainter({
    required this.percentage,
    required this.textCircleRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 1; i < (360 * percentage); i += 5) {
      final per = i / 360.0;
      // 色のグラデーションの定義
      // lerp()は、定義したグラデーションの範囲から色を選択する
      final color = ColorTween(
        begin: kColorIndicatorBegin,
        end: kColorIndicatorEnd,
      ).lerp(per)!;

      final paint = Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4;

      // 円とゲージの間の長さ
      const speaceLen = 16;
      // ゲージの長さ
      const lineLen = 24;
      // 0時方向から開始するため-90度ずらす
      // flutterでは3時方向から始まるため
      final angle = (2 * pi * per) - (pi / 2);

      // 円の中心座標
      final offset0 = Offset(size.width * 0.5, size.height * 0.5);
      // 線の内側の中心座標
      final offset1 = offset0.translate(
        (textCircleRadius + speaceLen) * cos(angle),
        (textCircleRadius + speaceLen) * sin(angle),
      );
      // 線の外側部分の座標
      final offset2 = offset1.translate(
        lineLen * cos(angle),
        lineLen * sin(angle),
      );

      canvas.drawLine(offset1, offset2, paint);
    }
  }

  @override
  bool shouldRepaint(_BatteryLevelIndicatorPainter oldDelegate) => false;
}

class BatteryLevelIndicator extends StatelessWidget {
  final percentage = 0.7;
  final size = 164.0;
  const BatteryLevelIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _BatteryLevelIndicatorPainter(
        percentage: percentage,
        textCircleRadius: size * 0.5,
      ),
      child: Container(
        padding: const EdgeInsets.all(64),
        // Materialを使用している理由は影を使いたいから
        // Containerだとelevationプロパティがない(予想)
        child: Material(
          color: Colors.white,
          elevation: kElevation,
          borderRadius: BorderRadius.circular(size * 0.5),
          child: SizedBox(
            width: size,
            height: size,
            child: Center(
              child: Text(
                '${percentage * 100}',
                style: const TextStyle(color: kColorPink, fontSize: 48),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
