import 'package:flutter/material.dart';
import 'package:signin_signup/const/color.dart';

class HeaderBackButton extends StatelessWidget {
  const HeaderBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: kButtonTextColorPrimary,
        backgroundColor: Colors.transparent,
        shape: const CircleBorder(
          side: BorderSide(color: kButtonColorPrimary),
        ),
      ),
      onPressed: () {},
      child: const Icon(Icons.chevron_left, color: kIconColor),
    );
  }
}
