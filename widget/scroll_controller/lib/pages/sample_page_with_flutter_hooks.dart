import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final isShowNotifierStateProvider = StateProvider((ref) => false);

class SamplePageWithFlutterHook extends HookConsumerWidget {
  const SamplePageWithFlutterHook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _scrollController = useScrollController();
    final isShowNotifier = ref.watch(isShowNotifierStateProvider);
    int _currentIndex = 0;
    final double itemHeight = 80.0;
    var servantList = [
      "Savar",
      "Archer",
      "Lancer",
      "Rider",
      "Caster",
      "Assassin",
      "Berserker",
      "Ruler",
      "Avenger",
      "Alterego",
      "Mooncancer",
      "Savar",
      "Archer",
      "Lancer",
      "Rider",
      "Caster",
      "Assassin",
      "Berserker",
      "Ruler",
      "Avenger",
      "Alterego",
      "Mooncancer"
    ];

    // スクロールを検知したときに呼ばれる処理
    void _scrollListener() {
      const threshold = 0.8;
      double positionRate =
          _scrollController.offset / _scrollController.position.maxScrollExtent;
      if (positionRate > threshold) {
        ref.read(isShowNotifierStateProvider.state).state = true;
      } else {
        ref.read(isShowNotifierStateProvider.state).state = false;
      }
    }

    _scrollController.addListener(_scrollListener);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Stack(
          children: [
            if (ref.read(isShowNotifierStateProvider))
              Container(
                padding: const EdgeInsets.all(8.0),
                width: double.infinity,
                color: Colors.orange[100],
                child: const Text(
                  'そろそろスクロールが終わるよ',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ListView.builder(
              controller: _scrollController,
              itemCount: 22,
              itemBuilder: (BuildContext context, int position) {
                return SizedBox(
                  height: itemHeight,
                  child: ListTile(
                    title: Text(servantList[position]),
                    subtitle: const Text('これはサンプルです'),
                    leading: const Icon(Icons.light),
                    trailing: const Icon(Icons.menu),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.keyboard_arrow_up),
            label: 'UP',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.keyboard_arrow_down),
            label: 'DOWN',
          ),
        ],
        onTap: (int index) {
          if (index == 0) {
            _scrollController.animateTo(
              _scrollController.offset - itemHeight,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
          if (index == 1) {
            _scrollController.animateTo(
              _scrollController.offset + itemHeight,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        },
      ),
    );
  }
}
