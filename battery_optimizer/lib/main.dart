import 'package:battery_optimizer/app_drainages/app_drainages.dart';
import 'package:battery_optimizer/const.dart';
import 'package:battery_optimizer/indicator/battery_level_indicator.dart';
import 'package:battery_optimizer/optimizer/optimizer_buttons.dart';
import 'package:flutter/material.dart';

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
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.white,
        primaryTextTheme: const TextTheme(
          headline6: TextStyle(color: kColorTitle),
        ),
        backgroundColor: Colors.white,
      ),
      home: const BatteryOptimizerPage(),
    );
  }
}

class BatteryOptimizerPage extends StatelessWidget {
  const BatteryOptimizerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text('Battery Optimizer'),
        centerTitle: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            OptimizerButtons(),
            BatteryLevelIndicator(),
            AppsDrainage(),
          ],
        ),
      ),
    );
  }
}
