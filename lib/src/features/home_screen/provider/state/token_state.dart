import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scryfall_api/scryfall_api.dart';

part "token_state.freezed.dart";

@freezed
class TokenState with _$TokenState {
  const factory TokenState({
    MtgCard? selectedToken,
    int? power,
    int? toughness,
    @Default(0) int tokenNumber,
    @Default(0) int tappedNumber,
    @Default(0) int prevTappedNumber,
    @Default(0) int weakNumber,
  }) = _TokenState;
}
