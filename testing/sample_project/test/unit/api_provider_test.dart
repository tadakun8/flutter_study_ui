import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sample_project/models/album.dart';
import 'package:sample_project/shared/api_client.dart';
import 'package:sample_project/shared/api_provider.dart';

class FakeApiClient extends ApiClient {
  FakeApiClient(String baseUrl) : super(baseUrl);

  @override
  Future<List<Album>> getAlbumList() async {
    return [
      const Album(userId: 1, id: 1, title: 'test1'),
      const Album(userId: 1, id: 2, title: 'test2'),
      const Album(userId: 2, id: 3, title: 'test3'),
    ];
  }

  @override
  Future<Album> getAlbum(int id) async {
    return const Album(userId: 1, id: 1, title: 'test1');
  }
}

void main() {
  test('albumListProvider', () async {
    // 依存しているApiClientProviderをmockにする
    final container = ProviderContainer(overrides: [
      apiClientProvider.overrideWithProvider(
        Provider((ref) => FakeApiClient('http://test.com')),
      )
    ]);

    // locading状態になっているかをテストする
    expect(
      container.read(albumListProvider),
      const AsyncValue<List<Album>>.loading(),
    );

    // リクエストが終了するのを待つ
    // sleepのつもりで以下を書いていると予想
    await Future<void>.value();
    // await Future.delayed(const Duration(seconds: 3));
    expect(container.read(albumListProvider).data!.value, [
      isA<Album>()
          .having((entity) => entity.userId, 'userId', 1)
          .having((entity) => entity.id, 'id', 1)
          .having((entity) => entity.title, 'title', 'test1'),
      isA<Album>()
          .having((entity) => entity.userId, 'userId', 1)
          .having((entity) => entity.id, 'id', 2)
          .having((entity) => entity.title, 'title', 'test2'),
      isA<Album>()
          .having((entity) => entity.userId, 'userId', 2)
          .having((entity) => entity.id, 'id', 3)
          .having((entity) => entity.title, 'title', 'test3'),
    ]);
  });
}
