import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scryfall_api/scryfall_api.dart';

part "token.freezed.dart";

/// dart run build_runner build

@freezed
class Token with _$Token {
  const Token._();
  factory Token({
    required MtgCard mtgCard,
    required int? power,
    required int? toughness,
    @Default(0) int tokenNumber,
    @Default(0) int tappedNumber,
    @Default(0) int prevTappedNumber,
    @Default(0) int weakNumber,
  }) = _Token;

  factory Token.fromMtgCard({
    required MtgCard mtgCard,
  }) =>
      Token(
        mtgCard: mtgCard,
        power: _getValue(mtgCard.power),
        toughness: _getValue(mtgCard.toughness),
      );

  static int? _getValue(String? s) {
    if (s == null) {
      return null;
    }
    try {
      return int.parse(s);
    } catch (e) {
      return 0;
    }
  }
}
