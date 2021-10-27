# changing_default_app_icon

A new Flutter project.

## アプリアイコン変更の仕方

### pubspec.yamlにflutter_launcher_iconの追加
```pubspec.yaml
dev_dependencies:
  ・・・
  flutter_launcher_icons: <- New!
```

### モジュールインストール
```
$ flutter pub get
```

### pubspec.yamlの(どこでもいいけどとりあえず)末尾に追加
```pubspec.yaml
flutter_icons:
  android: true 
  ios: true
  image_path: "lib/assets/icons/app_icon.png"
```

### image_pathで指定したパスに画像を追加
`image_path`は`pubspec.yaml`のある位置から始まる

### androidとiosプロジェクトのアイコンを入れ替える
```
$ flutter pub pub run flutter_launcher_icons:main
```

### 終了

### 参考

- https://github.com/sestegra/flutter_launcher_icons/blob/flavors/README.md
- https://qiita.com/rkowase/items/e0f3f8aec207ed8567aa
- https://betterprogramming.pub/2-ways-to-add-app-launcher-icons-in-flutter-e9fce30bc177
