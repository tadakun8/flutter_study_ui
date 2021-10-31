import 'package:api_with_http_package/model/album.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'album_list.freezed.dart';
part 'album_list.g.dart';

@freezed
abstract class AlbumList with _$AlbumList {
  const factory AlbumList({List<Album>? albumList}) = _AlbumList;
  factory AlbumList.fromJson(Map<String, dynamic> json) =>
      _$AlbumListFromJson(json);
}
