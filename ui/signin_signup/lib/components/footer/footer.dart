import 'package:flutter/material.dart';
import 'package:signin_signup/const/color.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have account ?",
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: kTextColorSecondary),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          "Sign up !",
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: kTextColorPrimary),
        ),
      ],
    );
  }
}
