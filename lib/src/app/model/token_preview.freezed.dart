// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_preview.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TokenPreview {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get imageUri => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TokenPreviewCopyWith<TokenPreview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenPreviewCopyWith<$Res> {
  factory $TokenPreviewCopyWith(
          TokenPreview value, $Res Function(TokenPreview) then) =
      _$TokenPreviewCopyWithImpl<$Res, TokenPreview>;
  @useResult
  $Res call({String id, String name, String? imageUri});
}

/// @nodoc
class _$TokenPreviewCopyWithImpl<$Res, $Val extends TokenPreview>
    implements $TokenPreviewCopyWith<$Res> {
  _$TokenPreviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUri = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUri: freezed == imageUri
          ? _value.imageUri
          : imageUri // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TokenPreviewImplCopyWith<$Res>
    implements $TokenPreviewCopyWith<$Res> {
  factory _$$TokenPreviewImplCopyWith(
          _$TokenPreviewImpl value, $Res Function(_$TokenPreviewImpl) then) =
      __$$TokenPreviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String? imageUri});
}

/// @nodoc
class __$$TokenPreviewImplCopyWithImpl<$Res>
    extends _$TokenPreviewCopyWithImpl<$Res, _$TokenPreviewImpl>
    implements _$$TokenPreviewImplCopyWith<$Res> {
  __$$TokenPreviewImplCopyWithImpl(
      _$TokenPreviewImpl _value, $Res Function(_$TokenPreviewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUri = freezed,
  }) {
    return _then(_$TokenPreviewImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUri: freezed == imageUri
          ? _value.imageUri
          : imageUri // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$TokenPreviewImpl extends _TokenPreview {
  _$TokenPreviewImpl({required this.id, required this.name, this.imageUri})
      : super._();

  @override
  final String id;
  @override
  final String name;
  @override
  final String? imageUri;

  @override
  String toString() {
    return 'TokenPreview(id: $id, name: $name, imageUri: $imageUri)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenPreviewImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUri, imageUri) ||
                other.imageUri == imageUri));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, imageUri);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenPreviewImplCopyWith<_$TokenPreviewImpl> get copyWith =>
      __$$TokenPreviewImplCopyWithImpl<_$TokenPreviewImpl>(this, _$identity);
}

abstract class _TokenPreview extends TokenPreview {
  factory _TokenPreview(
      {required final String id,
      required final String name,
      final String? imageUri}) = _$TokenPreviewImpl;
  _TokenPreview._() : super._();

  @override
  String get id;
  @override
  String get name;
  @override
  String? get imageUri;
  @override
  @JsonKey(ignore: true)
  _$$TokenPreviewImplCopyWith<_$TokenPreviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
