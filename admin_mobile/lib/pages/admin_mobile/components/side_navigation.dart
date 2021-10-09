import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

// ナビゲーションバーが選択している項目のインデックスを保持する
final selectedIndexProivider = StateProvider((_) => 0);

class SideNavigation extends ConsumerWidget {
  const SideNavigation({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final selectedIndex = watch(selectedIndexProivider).state;
    return NavigationRail(
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) {
        context.read(selectedIndexProivider).state = index;
      },
      // 選択するとラベルが表示されるが、デフォルトだとラベルの文字列長だけ
      // ナビゲーションバーの幅が広がる
      // labelType: NavigationRailLabelType.selected,
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.thumbs_up_down),
          label: Text('ThumbsUpDown'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.people),
          label: Text('People'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.face),
          label: Text('Face'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.bookmark),
          label: Text('Bookmark'),
        ),
      ],
    );
  }
}
