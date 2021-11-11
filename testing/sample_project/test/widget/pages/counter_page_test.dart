import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sample_project/pages/album_list_page.dart';
import 'package:sample_project/pages/counter_page.dart';
import 'package:sample_project/shared/api_provider.dart';

void main() {
  testWidgets(
      'Whether or not the intended value is displayed when initially displayed.',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: CounterPage(),
        ),
      ),
    );

    expect(find.text('Sample Project for Testing'), findsOneWidget);
    expect(find.text('You have pushed the button this many times:'),
        findsOneWidget);
    expect(find.text('0'), findsOneWidget);
    expect(find.text('Press the button five times to go to the album page.'),
        findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
  });

  testWidgets('Whether the count will be correct.',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: CounterPage(),
        ),
      ),
    );
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    expect(find.text('1'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    expect(find.text('2'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    expect(find.text('3'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    expect(find.text('4'), findsOneWidget);
  });

  testWidgets(
      'Whether or not the page transition is possible when the button is pressed five times',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: const MaterialApp(
          home: CounterPage(),
        ),
        overrides: [
          albumListProvider.overrideWithValue(
            const AsyncValue.data([]),
          )
        ],
      ),
    );
    await tester.tap(find.byIcon(Icons.add));
    await tester.tap(find.byIcon(Icons.add));
    await tester.tap(find.byIcon(Icons.add));
    await tester.tap(find.byIcon(Icons.add));
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    // expect(find.byType(CounterPage), findsNothing);
    expect(find.byType(CounterPage), findsNothing);
    expect(find.byType(AlbumListPage), findsOneWidget);
  });

  testWidgets(
      'Whether or not the page transition is possible when the button is pressed five times',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: const MaterialApp(
          home: CounterPage(),
        ),
        overrides: [
          albumListProvider.overrideWithValue(
            const AsyncValue.data([]),
          )
        ],
      ),
    );
    await tester.tap(find.byIcon(Icons.add));
    await tester.tap(find.byIcon(Icons.add));
    await tester.tap(find.byIcon(Icons.add));
    await tester.tap(find.byIcon(Icons.add));
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(find.byType(CounterPage), findsOneWidget);
    expect(find.byType(AlbumListPage), findsNothing);
    expect(find.text('0'), findsOneWidget);
  });
}
