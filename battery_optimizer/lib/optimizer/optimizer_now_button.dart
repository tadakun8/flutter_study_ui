import 'package:battery_optimizer/const.dart';
import 'package:flutter/material.dart';

class OptimizerNowButtons extends StatelessWidget {
  const OptimizerNowButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: ElevatedButton(
        child: const Text(
          'Optimizer Now',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: kColorPurple,
          padding: const EdgeInsets.symmetric(horizontal: 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
