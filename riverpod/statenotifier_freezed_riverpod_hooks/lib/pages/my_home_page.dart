import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:statenotifier_freezed_riverpod_hooks/state/counter_state.dart';

class MyHomePage extends HookConsumerWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // hooks_riverpodの1.0.0-dev.11ではuseProviderは使われない
    // final counterStateNotifier = useProvier(counterStateProvier);
    // final counterState = useProvider(counterStateProvier.state);
    final counterState = ref.watch(counterStateProvier);
    final counterStateNotifier = ref.read(counterStateProvier.notifier);
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
              '${counterState.count}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterStateNotifier.increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
