import 'package:flutter/material.dart';

/**
 * ColumnとRowをそれぞれ入れ子にしてもエラーにはならない
 */
class SamplePage extends StatelessWidget {
  const SamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Column(children: [
              Row(
                children: [
                  Column(
                    children: [Text('sample')],
                  )
                ],
              )
            ])
          ],
        ),
      ),
    );
  }
}
