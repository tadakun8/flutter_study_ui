import 'package:flutter/material.dart';
import 'package:online_learning/pages/courses/main.dart';
import 'package:online_learning/pages/top/components/info.dart';
import 'package:online_learning/pages/top/components/trending_courses.dart';

import 'components/featured.dart';
import '../../shared/componensts/header.dart';
import 'components/info.dart';

class TopPage extends StatefulWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  _TopPageState createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation1;
  late Animation<Offset> _animation2;
  late Animation<Offset> _animation3;
  late Animation<Offset> _animation4;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // アニメーションの座標範囲
    final tween = Tween<Offset>(
      // 現在地点から
      begin: Offset.zero,
      // 左に遷移(-1.0なので画面から表示されなくなる)
      end: const Offset(-1.0, 0.0),
    );

    // CurvedAnimationで弾んだようなアニメーションを作成する
    // 軌跡はCurves.XXXによる
    // tween.animate()でこの座標範囲の間でどのようなアニメーションをするか
    _animation1 = tween.animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.7, curve: Curves.easeInOutBack),
    ));
    _animation2 = tween.animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.1, 0.8, curve: Curves.easeInOutBack),
    ));
    _animation3 = tween.animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.2, 0.9, curve: Curves.easeInOutBack),
    ));
    _animation4 = tween.animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.3, 1.0, curve: Curves.easeInOutBack),
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SlideTransition(
                  position: _animation1,
                  child: const Header(
                    title: 'TurtleU',
                  ),
                ),
                SlideTransition(
                  position: _animation2,
                  child: const Info(),
                ),
                SlideTransition(
                  position: _animation3,
                  child: const Featured(),
                ),
                SlideTransition(
                  position: _animation4,
                  child: const TrendingCources(),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // アニメーション再生し、ページ遷移
          _controller.forward().then((_) => Navigator.of(context)
              .push(
                // アニメーションを伴う遷移の時はMaterialPageRoute()ではなくPageRouteBuildder()
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => const CoursesPage(),
                ),
              )
              // 戻ってくるときは逆再生
              .then((_) => _controller.reverse()));
        },
        child: const Icon(Icons.list),
      ),
    );
  }
}
