import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sample_project/componensts/album_list.dart';
import 'package:sample_project/models/album.dart';

void main() {
  const mockAlbum = Album(userId: 1, id: 2, title: 'test!');
  testWidgets(
    'Widget can be created succesfully',
    (WidgetTester tester) async {
      // Widgetが正常に構築されるかのテスト
      // components(custom widget)をテストするときはMaterialAppとScaffoldでラップする必要がある
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AlbumWidget(album: mockAlbum),
          ),
        ),
      );

      // Widgetで意図した値が表示されるかのテスト
      expect(find.text('test!'), findsOneWidget);
      expect(find.byIcon(Icons.music_note), findsOneWidget);
      expect(find.byIcon(Icons.more_vert), findsOneWidget);
    },
  );
}
