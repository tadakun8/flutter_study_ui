import 'package:flutter/material.dart';
import 'package:signin_signup/components/header/header_backbutton.dart';
import 'package:signin_signup/components/header/header_title.dart';

import 'header_background.dart';
import 'header_circles.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double height = 320;
    return SizedBox(
      height: height,
      // Stackで要素を重ねる
      child: Stack(
        children: const [
          Align(
            alignment: Alignment.topCenter,
            child: HeaderBackgroud(height: height),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: HeaderCircles(height: height),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 128),
              child: HeaderTitle(),
            ),
          ),
          Positioned(top: 16, left: 0, child: HeaderBackButton())
        ],
      ),
    );
  }
}
