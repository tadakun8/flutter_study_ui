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
      home: const MyWidget(),
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

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

// SingleTickerProviderStateMixinは
class _MyWidgetState extends State<MyWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      // vsyncがTickerProvider型なので、with SingleTickerProviderStateMixin が必要
      // controllerが複数あるならTickerProviderStateMixinを使用する
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    animation = Tween<double>(
      // アニメーション開始時のスケール
      begin: 1.0,
      // アニメーション終了時のスケール
      end: 2.0,
    ).animate(controller);

    // controllerのdrive()を使って以下のようにも書ける
    // controller.drive(Tween<double>(
    //   // アニメーション開始時のスケール
    //   begin: 1.0,
    //   // アニメーション終了時のスケール
    //   end: 2.0,
    // ));
  }

  // お約束
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                // アニメーション再生
                controller.forward();
              },
              icon: const Icon(Icons.play_arrow),
            ),
            IconButton(
              onPressed: () {
                // アニメーション再生
                controller.stop();
              },
              icon: const Icon(Icons.stop),
            ),
            IconButton(
              onPressed: () {
                // アニメーション再生
                controller.repeat();
              },
              icon: const Icon(Icons.loop),
            ),
          ],
        ),
      ),
      body: Center(
        child: ScaleTransition(
          scale: animation,
          child: Container(
            width: 50,
            height: 50,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
