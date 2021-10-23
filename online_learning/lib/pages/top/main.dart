import 'package:flutter/material.dart';
import 'package:online_learning/pages/courses/main.dart';
import 'package:online_learning/pages/top/components/info.dart';
import 'package:online_learning/pages/top/components/trending_courses.dart';

import 'components/featured.dart';
import '../../shared/componensts/header.dart';
import 'components/info.dart';

class TopPage extends StatelessWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: const [
                Header(
                  title: 'TurtleU',
                ),
                Info(),
                Featured(),
                TrendingCources(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            // アニメーションを伴う遷移の時はMaterialPageRoute()ではなくPageRouteBuildder()
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => const CoursesPage(),
            ),
          );
        },
        child: const Icon(Icons.list),
      ),
    );
  }
}
