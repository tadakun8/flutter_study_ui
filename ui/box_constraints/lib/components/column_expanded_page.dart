import 'package:flutter/material.dart';

class ColumnExpandedPage extends StatelessWidget {
  const ColumnExpandedPage({Key? key}) : super(key: key);

  // Columnの子にExpandedを配置するレイアウトなら問題なし
  // Container -> childを持っているためchildの大きさになる
  // Column -> 親からの最大値が設定されていないため、できるだけ小さくなろうとする
  // ExpandedでListViewは描画できる範囲まで描画する
  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     child: Column(
  //       children: [
  //         Expanded(
  //           child: ListView(children: [Text('data')]),
  //         )
  //       ],
  //     ),
  //   );
  // }

  // Column -> Column -> Expandedのように配置しようとするとエラー
  // Container -> childを持っているため、childの大きさになろうとする
  // 1つ目のColumn -> 親からの最大値が設定されていないため、できるだけ小さくなろうとする
  // 2つ目のColumn -> 親からの最大値が設定されていないため、できるだけ小さくなろうとする
  // ExpandedでListViewは描画できる範囲まで描画する
  // ListViewは2つ目のColumnの最大領域
  // ただ、1つ目のcolumnの大きさがここで決まっていないためエラーが出る
  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     child: Column(
  //       children: [
  //         Column(
  //           children: [
  //             Expanded(child: ListView(children: [Text('data')]))
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }

  // 解決方法 column_listview.dartの解決方法と同じ
  // 1つ目のカラムの子要素をラップする形になる
  // ただし、ListviewにshurinkWrapは使えない
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: ListView(shrinkWrap: true, children: [Text('data')]),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
