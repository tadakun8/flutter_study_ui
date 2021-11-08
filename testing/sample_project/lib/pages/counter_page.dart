import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_project/pages/album_list_page.dart';
import 'package:sample_project/state/counter_state.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ProviderListener(
      onChange: (context, CounterState counterState) async {
        // 5回ボタンが押されたときにアルバムページへ遷移
        if (counterState.count == 5) {
          // awaitをつけないとページ遷移する前にstateの初期化が走り、0が画面上に一瞬表示される
          await Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return const AlbumListPage();
          }));
          // stateの初期化
          context.read(counterStateProvider.notifier).reset();
        }
      },
      provider: counterStateProvider,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sample Project for Testing'),
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
                  '${watch(counterStateProvider).count}',
                  style: Theme.of(context).textTheme.headline4,
                );
              }),
              const Text(
                'Press the button five times to go to the album page.',
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read(counterStateProvider.notifier).increment();
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
