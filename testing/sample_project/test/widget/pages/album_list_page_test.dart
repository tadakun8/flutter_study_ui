import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sample_project/componensts/album_list.dart';
import 'package:sample_project/models/album.dart';
import 'package:sample_project/pages/album_list_page.dart';
import 'package:sample_project/shared/api_provider.dart';

void main() {
  testWidgets('display loading indicator', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: const MaterialApp(
          home: AlbumListPage(),
        ),
        overrides: [
          albumListProvider.overrideWithValue(
            const AsyncValue.loading(),
          )
        ],
      ),
    );
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('display album list', (WidgetTester tester) async {
    const testData = [
      Album(userId: 1, id: 1, title: 'test1'),
      Album(userId: 1, id: 2, title: 'test2'),
      Album(userId: 2, id: 3, title: 'test3'),
    ];

    await tester.pumpWidget(
      ProviderScope(
        child: const MaterialApp(
          home: AlbumListPage(),
        ),
        overrides: [
          albumListProvider.overrideWithValue(
            const AsyncValue.data(testData),
          )
        ],
      ),
    );
    expect(find.byType(AlbumListWidget), findsOneWidget);
  });

  testWidgets('display error', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: const MaterialApp(
          home: AlbumListPage(),
        ),
        overrides: [
          albumListProvider.overrideWithValue(
            AsyncValue.error('test error!'),
          )
        ],
      ),
    );
    expect(find.text('test error!'), findsOneWidget);
  });
}
