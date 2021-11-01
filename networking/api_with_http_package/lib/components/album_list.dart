import 'package:api_with_http_package/model/album.dart';
import 'package:api_with_http_package/pages/detail_page.dart';
import 'package:flutter/material.dart';

class AlbumWidget extends StatelessWidget {
  final Album album;

  const AlbumWidget({
    Key? key,
    required this.album,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.music_note),
      title: Text(album.title!),
      trailing: const Icon(Icons.more_vert),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) {
              return DetailPage(
                id: album.id!,
              );
            },
          ),
        );
      },
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
        ...albumList.map(
          (album) => AlbumWidget(
            album: album,
          ),
        ),
      ],
    );
  }
}
