import 'package:flutter/material.dart';
import 'package:signin_signup/components/form/signin_form.dart';

import 'components/header/header.dart';
import 'const/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(secondary: kAccentColor),
      ),
      home: const WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              Header(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: SigninForm(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
