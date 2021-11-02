import 'package:flutter/material.dart';
import 'package:signin_signup/const/color.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Welcome',
          style: Theme.of(context).textTheme.headline4!.copyWith(
                color: kTextColorPrimary,
                fontWeight: FontWeight.w500,
              ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          'Sign in to continue',
          style: Theme.of(context)
              .textTheme
              .subtitle2!
              .copyWith(color: kTextColorPrimary),
        )
      ],
    );
  }
}
