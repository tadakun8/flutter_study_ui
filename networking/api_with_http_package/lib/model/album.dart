import 'package:freezed_annotation/freezed_annotation.dart';

part 'album.freezed.dart';
part 'album.g.dart';

@freezed
abstract class Album with _$Album {
  const factory Album({int? userId, int? id, String? title}) = _Album;
  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
}
