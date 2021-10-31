import 'package:api_with_http_package/model/album.dart';
import 'package:flutter/material.dart';

class _AlbumWidget extends StatelessWidget {
  final Album album;
  const _AlbumWidget({
    Key? key,
    required this.album,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.music_note),
      title: Text(album.title!),
      trailing: const Icon(Icons.more_vert),
    );
  }
}

class AlbumListWidget extends StatelessWidget {
  final List<Album> albumList;
  const AlbumListWidget({
    Key? key,
    required this.albumList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...albumList.map((album) => _AlbumWidget(album: album)),
      ],
    );
  }
}
