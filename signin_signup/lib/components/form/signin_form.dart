import 'package:flutter/material.dart';
import 'package:signin_signup/const/color.dart';

class _CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool isObscureText;
  const _CustomTextField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.isObscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        hintStyle: const TextStyle(color: kTextColorSecondary),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: kAccentColor,
          ),
        ),
        // enabledBorderはテキストフィールドの枠線
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: kTextColorSecondary,
          ),
        ),
      ),
      obscureText: isObscureText,
      onTap: () {},
    );
  }
}

class SigninForm extends StatelessWidget {
  const SigninForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const _CustomTextField(
        labelText: 'Email',
        hintText: 'your email address goes here',
        isObscureText: false,
      ),
      const SizedBox(
        height: 48,
      ),
      const _CustomTextField(
        labelText: 'Password',
        hintText: 'your password goes here',
        isObscureText: true,
      ),
      const SizedBox(
        height: 4,
      ),
      Text(
        'Forgot Password?',
        style: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(color: kTextColorSecondary),
      ),
      const SizedBox(
        height: 48,
      ),
      Container(
        width: double.infinity,
        child: TextButton(
          style: TextButton.styleFrom(
            primary: kButtonTextColorPrimary,
            backgroundColor: kButtonColorPrimary,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {},
          child: Text(
            'Sign in',
            style: Theme.of(context).textTheme.button!.copyWith(
                  color: kButtonTextColorPrimary,
                  fontSize: 18,
                ),
          ),
        ),
      ),
      const SizedBox(
        height: 16,
      ),
      Text('OR',
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: kTextColorSecondary)),
      const SizedBox(
        height: 16,
      ),
      Text(
        'Connect with',
        style: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(color: kTextColorSecondary),
      ),
      const SizedBox(height: 24),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.account_circle),
        ),
        Container(
          color: kTextColorSecondary,
          width: 1,
          height: 16,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.account_circle),
        ),
      ])
    ]);
  }
}
