import 'package:flutter/material.dart';

class ColumnListviewPage extends StatelessWidget {
  const ColumnListviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Columnの中でListViewを使うとエラーになる

    // 以下サイト参考
    // (https://itome.team/blog/2019/12/flutter-advent-calendar-day9/)
    // MainAxis の決定方法( Column なら高さ、 Row なら幅)
    //   親からの Constraints で、最大値が設定されていて、 MainAxisSize.min が指定されている場合 → できるだけ小さくなろうとする
    //   親からの Constraints で、最大値が設定されていて、 MainAxisSize.max が指定されている場合 → できるだけ大きくなろうとする
    //   親からの Constraints で、最大値が設定されていない場合 → できるだけ小さくなろうとする
    // CrossAxis の決定方法( Column なら幅、 Row なら高さ)
    //   常にできるだけ小さくなろうとする

    // 以下のコードで
    // Column -> 親からの最大値が設定されていないため、できるだけ小さくなろうとする
    // ListView -> できるだけ大きくなろうとする
    // 小さくなろうとしているColumnと大きくなろうとしているListViewで、結果サイズが決まらないのでエラー
    // return Container(
    //   child: Column(
    //     children: [
    //       ListView(children: [Text('data')]),
    //     ],
    //   ),
    // );

    // 解決方法１ ListViewにshrinkWrap: true を追加
    // ListViewの大きさをListViewの子のサイズに合わせる
    // return Container(
    //   child: Column(
    //     children: [
    //       ListView(shrinkWrap: true, children: [Text('sam')]),
    //     ],
    //   ),
    // );

    // 解決方法２ heightプロパティがついたContainer()・SizedBox()・LimitedBox()でListViewをラップする
    // ListViewの大きさを指定する
    // return Container(
    //   child: Column(
    //     children: [
    //       Container(
    //         height: 100,
    //         child: ListView(shrinkWrap: true, children: [Text('sam')]),
    //       )
    //     ],
    //   ),
    // );

    // 解決方法３ Expand()またはFlexible()でListViewをラップする
    // ListViewの大きさを指定する
    // ExpandedでListViewは描画できるまでの大きさになると宣言する
    return Container(
      child: Column(
        children: [
          Expanded(
            child: ListView(children: [Text('data')]),
          )
        ],
      ),
    );
  }
}
