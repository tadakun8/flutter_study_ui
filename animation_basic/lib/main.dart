import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ScaleSquare(),
    );
  }
}

class ScaleSquare extends StatefulWidget {
  const ScaleSquare({Key? key}) : super(key: key);

  @override
  _ScaleSquare createState() => _ScaleSquare();
}

class _ScaleSquare extends State<ScaleSquare> {
  double size = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            size = 200;
          });
        },
        child: const Icon(Icons.play_arrow),
      ),
      body: Center(
        // Animated系は動作時間のみを指定できる
        // 手軽にアニメーションを実装したい場合に使用する
        child: AnimatedContainer(
          // 1. アニメーションの動作時間
          duration: const Duration(
            seconds: 1,
          ),
          // 2. 変化させたいプロパティ
          width: size,
          height: size,
          color: Colors.blue,
        ),
      ),
    );
  }
}
