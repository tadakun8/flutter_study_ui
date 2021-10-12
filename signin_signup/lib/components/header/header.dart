import 'package:flutter/material.dart';

import 'header_background.dart';
import 'header_circles.dart';

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
        Align(
          alignment: Alignment.topCenter,
          child: HeaderCircles(height: height),
        ),
      ]),
    );
  }
}
