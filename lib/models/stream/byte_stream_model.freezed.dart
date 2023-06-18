// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'byte_stream_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ByteStreamModel {
  List<int> get bytes => throw _privateConstructorUsedError;
  int get contentLength => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ByteStreamModelCopyWith<ByteStreamModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ByteStreamModelCopyWith<$Res> {
  factory $ByteStreamModelCopyWith(
          ByteStreamModel value, $Res Function(ByteStreamModel) then) =
      _$ByteStreamModelCopyWithImpl<$Res, ByteStreamModel>;
  @useResult
  $Res call({List<int> bytes, int contentLength});
}

/// @nodoc
class _$ByteStreamModelCopyWithImpl<$Res, $Val extends ByteStreamModel>
    implements $ByteStreamModelCopyWith<$Res> {
  _$ByteStreamModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bytes = null,
    Object? contentLength = null,
  }) {
    return _then(_value.copyWith(
      bytes: null == bytes
          ? _value.bytes
          : bytes // ignore: cast_nullable_to_non_nullable
              as List<int>,
      contentLength: null == contentLength
          ? _value.contentLength
          : contentLength // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ByteStreamModelCopyWith<$Res>
    implements $ByteStreamModelCopyWith<$Res> {
  factory _$$_ByteStreamModelCopyWith(
          _$_ByteStreamModel value, $Res Function(_$_ByteStreamModel) then) =
      __$$_ByteStreamModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<int> bytes, int contentLength});
}

/// @nodoc
class __$$_ByteStreamModelCopyWithImpl<$Res>
    extends _$ByteStreamModelCopyWithImpl<$Res, _$_ByteStreamModel>
    implements _$$_ByteStreamModelCopyWith<$Res> {
  __$$_ByteStreamModelCopyWithImpl(
      _$_ByteStreamModel _value, $Res Function(_$_ByteStreamModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bytes = null,
    Object? contentLength = null,
  }) {
    return _then(_$_ByteStreamModel(
      bytes: null == bytes
          ? _value._bytes
          : bytes // ignore: cast_nullable_to_non_nullable
              as List<int>,
      contentLength: null == contentLength
          ? _value.contentLength
          : contentLength // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ByteStreamModel implements _ByteStreamModel {
  _$_ByteStreamModel(
      {required final List<int> bytes, required this.contentLength})
      : _bytes = bytes;

  final List<int> _bytes;
  @override
  List<int> get bytes {
    if (_bytes is EqualUnmodifiableListView) return _bytes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bytes);
  }

  @override
  final int contentLength;

  @override
  String toString() {
    return 'ByteStreamModel(bytes: $bytes, contentLength: $contentLength)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ByteStreamModel &&
            const DeepCollectionEquality().equals(other._bytes, _bytes) &&
            (identical(other.contentLength, contentLength) ||
                other.contentLength == contentLength));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_bytes), contentLength);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ByteStreamModelCopyWith<_$_ByteStreamModel> get copyWith =>
      __$$_ByteStreamModelCopyWithImpl<_$_ByteStreamModel>(this, _$identity);
}

abstract class _ByteStreamModel implements ByteStreamModel {
  factory _ByteStreamModel(
      {required final List<int> bytes,
      required final int contentLength}) = _$_ByteStreamModel;

  @override
  List<int> get bytes;
  @override
  int get contentLength;
  @override
  @JsonKey(ignore: true)
  _$$_ByteStreamModelCopyWith<_$_ByteStreamModel> get copyWith =>
      throw _privateConstructorUsedError;
}
