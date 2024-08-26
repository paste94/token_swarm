// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Token {
  MtgCard get mtgCard => throw _privateConstructorUsedError;
  int? get power => throw _privateConstructorUsedError;
  int? get toughness => throw _privateConstructorUsedError;
  int get tokenNumber => throw _privateConstructorUsedError;
  int get tappedNumber => throw _privateConstructorUsedError;
  int get prevTappedNumber => throw _privateConstructorUsedError;
  int get weakNumber => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TokenCopyWith<Token> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenCopyWith<$Res> {
  factory $TokenCopyWith(Token value, $Res Function(Token) then) =
      _$TokenCopyWithImpl<$Res, Token>;
  @useResult
  $Res call(
      {MtgCard mtgCard,
      int? power,
      int? toughness,
      int tokenNumber,
      int tappedNumber,
      int prevTappedNumber,
      int weakNumber});
}

/// @nodoc
class _$TokenCopyWithImpl<$Res, $Val extends Token>
    implements $TokenCopyWith<$Res> {
  _$TokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mtgCard = null,
    Object? power = freezed,
    Object? toughness = freezed,
    Object? tokenNumber = null,
    Object? tappedNumber = null,
    Object? prevTappedNumber = null,
    Object? weakNumber = null,
  }) {
    return _then(_value.copyWith(
      mtgCard: null == mtgCard
          ? _value.mtgCard
          : mtgCard // ignore: cast_nullable_to_non_nullable
              as MtgCard,
      power: freezed == power
          ? _value.power
          : power // ignore: cast_nullable_to_non_nullable
              as int?,
      toughness: freezed == toughness
          ? _value.toughness
          : toughness // ignore: cast_nullable_to_non_nullable
              as int?,
      tokenNumber: null == tokenNumber
          ? _value.tokenNumber
          : tokenNumber // ignore: cast_nullable_to_non_nullable
              as int,
      tappedNumber: null == tappedNumber
          ? _value.tappedNumber
          : tappedNumber // ignore: cast_nullable_to_non_nullable
              as int,
      prevTappedNumber: null == prevTappedNumber
          ? _value.prevTappedNumber
          : prevTappedNumber // ignore: cast_nullable_to_non_nullable
              as int,
      weakNumber: null == weakNumber
          ? _value.weakNumber
          : weakNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TokenImplCopyWith<$Res> implements $TokenCopyWith<$Res> {
  factory _$$TokenImplCopyWith(
          _$TokenImpl value, $Res Function(_$TokenImpl) then) =
      __$$TokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MtgCard mtgCard,
      int? power,
      int? toughness,
      int tokenNumber,
      int tappedNumber,
      int prevTappedNumber,
      int weakNumber});
}

/// @nodoc
class __$$TokenImplCopyWithImpl<$Res>
    extends _$TokenCopyWithImpl<$Res, _$TokenImpl>
    implements _$$TokenImplCopyWith<$Res> {
  __$$TokenImplCopyWithImpl(
      _$TokenImpl _value, $Res Function(_$TokenImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mtgCard = null,
    Object? power = freezed,
    Object? toughness = freezed,
    Object? tokenNumber = null,
    Object? tappedNumber = null,
    Object? prevTappedNumber = null,
    Object? weakNumber = null,
  }) {
    return _then(_$TokenImpl(
      mtgCard: null == mtgCard
          ? _value.mtgCard
          : mtgCard // ignore: cast_nullable_to_non_nullable
              as MtgCard,
      power: freezed == power
          ? _value.power
          : power // ignore: cast_nullable_to_non_nullable
              as int?,
      toughness: freezed == toughness
          ? _value.toughness
          : toughness // ignore: cast_nullable_to_non_nullable
              as int?,
      tokenNumber: null == tokenNumber
          ? _value.tokenNumber
          : tokenNumber // ignore: cast_nullable_to_non_nullable
              as int,
      tappedNumber: null == tappedNumber
          ? _value.tappedNumber
          : tappedNumber // ignore: cast_nullable_to_non_nullable
              as int,
      prevTappedNumber: null == prevTappedNumber
          ? _value.prevTappedNumber
          : prevTappedNumber // ignore: cast_nullable_to_non_nullable
              as int,
      weakNumber: null == weakNumber
          ? _value.weakNumber
          : weakNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TokenImpl extends _Token {
  _$TokenImpl(
      {required this.mtgCard,
      required this.power,
      required this.toughness,
      this.tokenNumber = 0,
      this.tappedNumber = 0,
      this.prevTappedNumber = 0,
      this.weakNumber = 0})
      : super._();

  @override
  final MtgCard mtgCard;
  @override
  final int? power;
  @override
  final int? toughness;
  @override
  @JsonKey()
  final int tokenNumber;
  @override
  @JsonKey()
  final int tappedNumber;
  @override
  @JsonKey()
  final int prevTappedNumber;
  @override
  @JsonKey()
  final int weakNumber;

  @override
  String toString() {
    return 'Token(mtgCard: $mtgCard, power: $power, toughness: $toughness, tokenNumber: $tokenNumber, tappedNumber: $tappedNumber, prevTappedNumber: $prevTappedNumber, weakNumber: $weakNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenImpl &&
            (identical(other.mtgCard, mtgCard) || other.mtgCard == mtgCard) &&
            (identical(other.power, power) || other.power == power) &&
            (identical(other.toughness, toughness) ||
                other.toughness == toughness) &&
            (identical(other.tokenNumber, tokenNumber) ||
                other.tokenNumber == tokenNumber) &&
            (identical(other.tappedNumber, tappedNumber) ||
                other.tappedNumber == tappedNumber) &&
            (identical(other.prevTappedNumber, prevTappedNumber) ||
                other.prevTappedNumber == prevTappedNumber) &&
            (identical(other.weakNumber, weakNumber) ||
                other.weakNumber == weakNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mtgCard, power, toughness,
      tokenNumber, tappedNumber, prevTappedNumber, weakNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenImplCopyWith<_$TokenImpl> get copyWith =>
      __$$TokenImplCopyWithImpl<_$TokenImpl>(this, _$identity);
}

abstract class _Token extends Token {
  factory _Token(
      {required final MtgCard mtgCard,
      required final int? power,
      required final int? toughness,
      final int tokenNumber,
      final int tappedNumber,
      final int prevTappedNumber,
      final int weakNumber}) = _$TokenImpl;
  _Token._() : super._();

  @override
  MtgCard get mtgCard;
  @override
  int? get power;
  @override
  int? get toughness;
  @override
  int get tokenNumber;
  @override
  int get tappedNumber;
  @override
  int get prevTappedNumber;
  @override
  int get weakNumber;
  @override
  @JsonKey(ignore: true)
  _$$TokenImplCopyWith<_$TokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
