// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'album_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AlbumListTearOff {
  const _$AlbumListTearOff();

  _AlbumList call({List<Album>? albumList}) {
    return _AlbumList(
      albumList: albumList,
    );
  }
}

/// @nodoc
const $AlbumList = _$AlbumListTearOff();

/// @nodoc
mixin _$AlbumList {
  List<Album>? get albumList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AlbumListCopyWith<AlbumList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumListCopyWith<$Res> {
  factory $AlbumListCopyWith(AlbumList value, $Res Function(AlbumList) then) =
      _$AlbumListCopyWithImpl<$Res>;
  $Res call({List<Album>? albumList});
}

/// @nodoc
class _$AlbumListCopyWithImpl<$Res> implements $AlbumListCopyWith<$Res> {
  _$AlbumListCopyWithImpl(this._value, this._then);

  final AlbumList _value;
  // ignore: unused_field
  final $Res Function(AlbumList) _then;

  @override
  $Res call({
    Object? albumList = freezed,
  }) {
    return _then(_value.copyWith(
      albumList: albumList == freezed
          ? _value.albumList
          : albumList // ignore: cast_nullable_to_non_nullable
              as List<Album>?,
    ));
  }
}

/// @nodoc
abstract class _$AlbumListCopyWith<$Res> implements $AlbumListCopyWith<$Res> {
  factory _$AlbumListCopyWith(
          _AlbumList value, $Res Function(_AlbumList) then) =
      __$AlbumListCopyWithImpl<$Res>;
  @override
  $Res call({List<Album>? albumList});
}

/// @nodoc
class __$AlbumListCopyWithImpl<$Res> extends _$AlbumListCopyWithImpl<$Res>
    implements _$AlbumListCopyWith<$Res> {
  __$AlbumListCopyWithImpl(_AlbumList _value, $Res Function(_AlbumList) _then)
      : super(_value, (v) => _then(v as _AlbumList));

  @override
  _AlbumList get _value => super._value as _AlbumList;

  @override
  $Res call({
    Object? albumList = freezed,
  }) {
    return _then(_AlbumList(
      albumList: albumList == freezed
          ? _value.albumList
          : albumList // ignore: cast_nullable_to_non_nullable
              as List<Album>?,
    ));
  }
}

/// @nodoc

class _$_AlbumList implements _AlbumList {
  const _$_AlbumList({this.albumList});

  @override
  final List<Album>? albumList;

  @override
  String toString() {
    return 'AlbumList(albumList: $albumList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AlbumList &&
            const DeepCollectionEquality().equals(other.albumList, albumList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(albumList));

  @JsonKey(ignore: true)
  @override
  _$AlbumListCopyWith<_AlbumList> get copyWith =>
      __$AlbumListCopyWithImpl<_AlbumList>(this, _$identity);
}

abstract class _AlbumList implements AlbumList {
  const factory _AlbumList({List<Album>? albumList}) = _$_AlbumList;

  @override
  List<Album>? get albumList;
  @override
  @JsonKey(ignore: true)
  _$AlbumListCopyWith<_AlbumList> get copyWith =>
      throw _privateConstructorUsedError;
}
