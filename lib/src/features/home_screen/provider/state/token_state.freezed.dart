// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TokenState {
  MtgCard? get selectedToken => throw _privateConstructorUsedError;
  int get tokenNumber => throw _privateConstructorUsedError;
  int get tappenDumber => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TokenStateCopyWith<TokenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenStateCopyWith<$Res> {
  factory $TokenStateCopyWith(
          TokenState value, $Res Function(TokenState) then) =
      _$TokenStateCopyWithImpl<$Res, TokenState>;
  @useResult
  $Res call({MtgCard? selectedToken, int tokenNumber, int tappenDumber});
}

/// @nodoc
class _$TokenStateCopyWithImpl<$Res, $Val extends TokenState>
    implements $TokenStateCopyWith<$Res> {
  _$TokenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedToken = freezed,
    Object? tokenNumber = null,
    Object? tappenDumber = null,
  }) {
    return _then(_value.copyWith(
      selectedToken: freezed == selectedToken
          ? _value.selectedToken
          : selectedToken // ignore: cast_nullable_to_non_nullable
              as MtgCard?,
      tokenNumber: null == tokenNumber
          ? _value.tokenNumber
          : tokenNumber // ignore: cast_nullable_to_non_nullable
              as int,
      tappenDumber: null == tappenDumber
          ? _value.tappenDumber
          : tappenDumber // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TokenStateImplCopyWith<$Res>
    implements $TokenStateCopyWith<$Res> {
  factory _$$TokenStateImplCopyWith(
          _$TokenStateImpl value, $Res Function(_$TokenStateImpl) then) =
      __$$TokenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MtgCard? selectedToken, int tokenNumber, int tappenDumber});
}

/// @nodoc
class __$$TokenStateImplCopyWithImpl<$Res>
    extends _$TokenStateCopyWithImpl<$Res, _$TokenStateImpl>
    implements _$$TokenStateImplCopyWith<$Res> {
  __$$TokenStateImplCopyWithImpl(
      _$TokenStateImpl _value, $Res Function(_$TokenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedToken = freezed,
    Object? tokenNumber = null,
    Object? tappenDumber = null,
  }) {
    return _then(_$TokenStateImpl(
      selectedToken: freezed == selectedToken
          ? _value.selectedToken
          : selectedToken // ignore: cast_nullable_to_non_nullable
              as MtgCard?,
      tokenNumber: null == tokenNumber
          ? _value.tokenNumber
          : tokenNumber // ignore: cast_nullable_to_non_nullable
              as int,
      tappenDumber: null == tappenDumber
          ? _value.tappenDumber
          : tappenDumber // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TokenStateImpl implements _TokenState {
  const _$TokenStateImpl(
      {this.selectedToken, this.tokenNumber = 0, this.tappenDumber = 0});

  @override
  final MtgCard? selectedToken;
  @override
  @JsonKey()
  final int tokenNumber;
  @override
  @JsonKey()
  final int tappenDumber;

  @override
  String toString() {
    return 'TokenState(selectedToken: $selectedToken, tokenNumber: $tokenNumber, tappenDumber: $tappenDumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenStateImpl &&
            (identical(other.selectedToken, selectedToken) ||
                other.selectedToken == selectedToken) &&
            (identical(other.tokenNumber, tokenNumber) ||
                other.tokenNumber == tokenNumber) &&
            (identical(other.tappenDumber, tappenDumber) ||
                other.tappenDumber == tappenDumber));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, selectedToken, tokenNumber, tappenDumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenStateImplCopyWith<_$TokenStateImpl> get copyWith =>
      __$$TokenStateImplCopyWithImpl<_$TokenStateImpl>(this, _$identity);
}

abstract class _TokenState implements TokenState {
  const factory _TokenState(
      {final MtgCard? selectedToken,
      final int tokenNumber,
      final int tappenDumber}) = _$TokenStateImpl;

  @override
  MtgCard? get selectedToken;
  @override
  int get tokenNumber;
  @override
  int get tappenDumber;
  @override
  @JsonKey(ignore: true)
  _$$TokenStateImplCopyWith<_$TokenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
