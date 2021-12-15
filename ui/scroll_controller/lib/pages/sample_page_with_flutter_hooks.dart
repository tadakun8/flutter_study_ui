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

    // スクロールを検知したときに呼ばれる処理
    void _scrollListener() {
      const threshold = 0.8;
      double positionRate =
          _scrollController.offset / _scrollController.position.maxScrollExtent;
      if (positionRate > threshold) {
        ref.read(isShowNotifierStateProvider.state).state = true;
      }
      if (positionRate < threshold - 0.05) {
        ref.read(isShowNotifierStateProvider.state).state = false;
      }
    }

    return Container(
      child: Text("sample"),
    );
  }
}
