// 必要な箇所をConsumerでラップした場合
// ラップした部分に変更があればそこだけ再描画 -> パフォーマンスは上記より高い
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statenotifier_freezed_riverpod/state/counter_state.dart';

class MyHomePageConsumer extends StatelessWidget {
  final String title;

  const MyHomePageConsumer({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Consumer(builder: (context, watch, child) {
              return Text(
                '${watch(countStateProvider).count}',
                style: Theme.of(context).textTheme.headline4,
              ); // ←ここ
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read(countStateProvider.notifier).increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
