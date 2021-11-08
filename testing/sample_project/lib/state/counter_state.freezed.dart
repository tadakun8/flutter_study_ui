// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'counter_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CounterState _$CounterStateFromJson(Map<String, dynamic> json) {
  return _CounterState.fromJson(json);
}

/// @nodoc
class _$CounterStateTearOff {
  const _$CounterStateTearOff();

  _CounterState call({int? count, bool? isEnabled}) {
    return _CounterState(
      count: count,
      isEnabled: isEnabled,
    );
  }

  CounterState fromJson(Map<String, Object> json) {
    return CounterState.fromJson(json);
  }
}

/// @nodoc
const $CounterState = _$CounterStateTearOff();

/// @nodoc
mixin _$CounterState {
  int? get count => throw _privateConstructorUsedError;
  bool? get isEnabled => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CounterStateCopyWith<CounterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CounterStateCopyWith<$Res> {
  factory $CounterStateCopyWith(
          CounterState value, $Res Function(CounterState) then) =
      _$CounterStateCopyWithImpl<$Res>;
  $Res call({int? count, bool? isEnabled});
}

/// @nodoc
class _$CounterStateCopyWithImpl<$Res> implements $CounterStateCopyWith<$Res> {
  _$CounterStateCopyWithImpl(this._value, this._then);

  final CounterState _value;
  // ignore: unused_field
  final $Res Function(CounterState) _then;

  @override
  $Res call({
    Object? count = freezed,
    Object? isEnabled = freezed,
  }) {
    return _then(_value.copyWith(
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      isEnabled: isEnabled == freezed
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$CounterStateCopyWith<$Res>
    implements $CounterStateCopyWith<$Res> {
  factory _$CounterStateCopyWith(
          _CounterState value, $Res Function(_CounterState) then) =
      __$CounterStateCopyWithImpl<$Res>;
  @override
  $Res call({int? count, bool? isEnabled});
}

/// @nodoc
class __$CounterStateCopyWithImpl<$Res> extends _$CounterStateCopyWithImpl<$Res>
    implements _$CounterStateCopyWith<$Res> {
  __$CounterStateCopyWithImpl(
      _CounterState _value, $Res Function(_CounterState) _then)
      : super(_value, (v) => _then(v as _CounterState));

  @override
  _CounterState get _value => super._value as _CounterState;

  @override
  $Res call({
    Object? count = freezed,
    Object? isEnabled = freezed,
  }) {
    return _then(_CounterState(
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      isEnabled: isEnabled == freezed
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CounterState implements _CounterState {
  const _$_CounterState({this.count, this.isEnabled});

  factory _$_CounterState.fromJson(Map<String, dynamic> json) =>
      _$$_CounterStateFromJson(json);

  @override
  final int? count;
  @override
  final bool? isEnabled;

  @override
  String toString() {
    return 'CounterState(count: $count, isEnabled: $isEnabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CounterState &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.isEnabled, isEnabled) ||
                const DeepCollectionEquality()
                    .equals(other.isEnabled, isEnabled)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(isEnabled);

  @JsonKey(ignore: true)
  @override
  _$CounterStateCopyWith<_CounterState> get copyWith =>
      __$CounterStateCopyWithImpl<_CounterState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CounterStateToJson(this);
  }
}

abstract class _CounterState implements CounterState {
  const factory _CounterState({int? count, bool? isEnabled}) = _$_CounterState;

  factory _CounterState.fromJson(Map<String, dynamic> json) =
      _$_CounterState.fromJson;

  @override
  int? get count => throw _privateConstructorUsedError;
  @override
  bool? get isEnabled => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CounterStateCopyWith<_CounterState> get copyWith =>
      throw _privateConstructorUsedError;
}
