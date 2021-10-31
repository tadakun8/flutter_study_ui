// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AlbumList _$$_AlbumListFromJson(Map<String, dynamic> json) => _$_AlbumList(
      albumList: (json['albumList'] as List<dynamic>?)
          ?.map((e) => Album.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AlbumListToJson(_$_AlbumList instance) =>
    <String, dynamic>{
      'albumList': instance.albumList,
    };
