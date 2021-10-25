// ConsumerWidgetを継承した場合
// 値に変更があればConsumerWidget内の全てのWidgetが再描画
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statenotifier_freezed_riverpod/pages/state_check_page.dart';
import 'package:statenotifier_freezed_riverpod/state/counter_state.dart';

class MyHomePageConsumerWidget extends ConsumerWidget {
  final String title;

  const MyHomePageConsumerWidget({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    // stateやnotifierを取得する方法は2つ
    // 1. context.read() ・・・ 値の変更を監視しない
    // 2. watch(Provider)・・・変更を監視する
    final counterNotifier = context.read(countStateProvider.notifier);
    final count = watch(countStateProvider).count;

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
            Text(
              '$count',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterNotifier.increment();
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return const StateCheckPage();
          }));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
