import 'package:flutter/material.dart';

class HeaderCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, size.height * 0.5)
      ..quadraticBezierTo(
        size.width * 0.55,
        size.height,
        size.width,
        size.height * 0.6,
      )
      ..lineTo(size.width, 0)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class HeaderBackgroud extends StatelessWidget {
  final double height;
  const HeaderBackgroud({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: HeaderCurveClipper(),
      child: Container(
        width: double.infinity,
        height: height,
        // Containerの枠線
        decoration: const BoxDecoration(
            // 色の変化(グラーデーションの設定)
            // 左上から右下まで、色を0xFFFD9766から0xFFFF7362に変化させていく
            // 範囲 : stops[0, 1]で最初から最後まで
            gradient: LinearGradient(
          begin: FractionalOffset.topLeft,
          end: FractionalOffset.bottomRight,
          colors: [
            Color(0xFFFD9766),
            Color(0xFFFF7362),
          ],
          stops: [0, 1],
        )),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double height = 320;
    return Container(
      height: height,
      // Stackで要素を重ねる
      child: Stack(children: const [
        Align(
          alignment: Alignment.topCenter,
          child: HeaderBackgroud(height: height),
        ),
      ]),
    );
  }
}
