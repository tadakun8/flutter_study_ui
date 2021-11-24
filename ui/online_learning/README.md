# online_learning

A new Flutter project.

## Demo

![demo](https://user-images.githubusercontent.com/64715484/143199006-4a698a51-4e5b-4a3b-a79a-c14beb5eccb5.gif)

## 実装メモ

### Transition系のアニメーションの実装フロー

ページ遷移にアニメーションをつけるときのフロー

1. stateful widget作成
1. stateには`SingleTickerProviderStateMixin`をwithする
1. プロパティに`AnimationController`と`Animation`を定義
    - `late`で定義
1. initStateをoverride
    - AnimmationControllerを定義
    - Tweenを定義
    - Animationを定義
1. `dispose()`をoverride
1. アニメーションを付与するwidgetを`XXXTransition`でラップする
    - 今回はSlideTransition
1. ボタンを押したときにアニメーション発火
    - controller.forward()
    - その後にthen()の中でページ遷移
    - ページ遷移は`PageRouteBuilder()`を使用する
  ```
  PageRouteBuilder(
    pageBuilder: (_, __, ___) => const CoursesPage(),
  ),
  ```
    - その後のthen()で_controller.reverse()をつけて前ページから戻ってきたときに戻す
