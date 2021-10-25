import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statenotifier_freezed_riverpod/state/counter_state.dart';

class StateCheckPage extends StatelessWidget {
  const StateCheckPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Check'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'State is ...',
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
    );
  }
}
