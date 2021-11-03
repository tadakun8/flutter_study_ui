import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:future_provider/componensts/album_list.dart';
import 'package:future_provider/models/album.dart';
import 'package:future_provider/shared/api_provider.dart';

class AlbumListPage extends ConsumerWidget {
  const AlbumListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    AsyncValue<List<Album>> asyncValue = watch(albumListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Example'),
      ),
      body: SafeArea(
        child: asyncValue.when(
          data: (albumList) => SingleChildScrollView(
            child: AlbumListWidget(
              albumList: albumList,
            ),
          ),
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          error: (err, stack) => Text('$err'),
        ),
      ),
    );
  }
}
