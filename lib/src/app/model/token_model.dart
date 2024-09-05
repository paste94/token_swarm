import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scryfall_api/scryfall_api.dart';

part "token_model.freezed.dart";

/// dart run build_runner build

@freezed
class TokenModel with _$TokenModel {
  const TokenModel._();
  factory TokenModel({
    required int? power,
    required int? toughness,
    required String id,
    required List<CardFace>? cardFaces,
    required ImageUris? imageUris,
    required String name,
    @Default(0) int tokenNumber,
    @Default(0) int tappedNumber,
    @Default(0) int prevTappedNumber,
    @Default(0) int weakNumber,
  }) = _TokenModel;

  factory TokenModel.fromMtgCard(MtgCard mtgCard) => TokenModel(
        power: _getValue(mtgCard.power),
        toughness: _getValue(mtgCard.toughness),
        id: mtgCard.id,
        cardFaces: mtgCard.cardFaces,
        imageUris: mtgCard.imageUris,
        name: mtgCard.name,
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
