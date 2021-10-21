import 'package:flutter/material.dart';
import 'package:online_learning/pages/top/components/info.dart';

import 'components/featured.dart';
import 'components/header.dart';
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
                // _TrendingCourses(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.list),
      ),
    );
  }
}
