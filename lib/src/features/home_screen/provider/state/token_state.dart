import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scryfall_api/scryfall_api.dart';

part "token_state.freezed.dart";

@freezed
class TokenState with _$TokenState {
  const factory TokenState({
    MtgCard? selectedToken,
    @Default(0) int tokenNumber,
    @Default(0) int tappenDumber,
  }) = _TokenState;
}
