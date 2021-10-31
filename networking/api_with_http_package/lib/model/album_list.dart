import 'package:api_with_http_package/model/album.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'album_list.freezed.dart';

@freezed
abstract class AlbumList with _$AlbumList {
  const factory AlbumList({List<Album>? albumList}) = _AlbumList;
  factory AlbumList.fromJson(List<dynamic> parsedJson) {
    List<Album> albumList =
        parsedJson.map((item) => Album.fromJson(item)).toList();
    return AlbumList(albumList: albumList);
  }
}
