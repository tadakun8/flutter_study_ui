# changing_default_app_icon

Project with Flutter's default icon changed.

## How to change the app icon

There are four steps.

1. Add `flutter_launcher_icon` to `pubspec.yaml`
1. Install package
1. Add the path of the new icon to `pubspec.yaml`
1. Replacing the app icon in android and IOS projects

### Add `flutter_launcher_icon` to `pubspec.yaml`

```pubspec.yaml
dev_dependencies:
  ・・・
  flutter_launcher_icons: <- New!
```

### Install package

```
$ flutter pub get
```

### Add the path of the new icon to `pubspec.yaml`

```pubspec.yaml
flutter_icons:
  android: true 
  ios: true
  image_path: "lib/assets/icons/app_icon.png"
```

- This time, I added it to the end of pubspec.yaml
- The current path of image_path starts from the hierarchy where pubspec.yaml is located
- You can also specify icons for android and IOS separately
    - https://github.com/sestegra/flutter_launcher_icons/blob/flavors/README.md

### Replacing the app icon in android and IOS projects

```
$ flutter pub pub run flutter_launcher_icons:main
```

## References

- https://github.com/sestegra/flutter_launcher_icons/blob/flavors/README.md
- https://qiita.com/rkowase/items/e0f3f8aec207ed8567aa
- https://betterprogramming.pub/2-ways-to-add-app-launcher-icons-in-flutter-e9fce30bc177
