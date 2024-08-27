import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scryfall_api/scryfall_api.dart';

part "token_model.freezed.dart";

/// dart run build_runner build

@freezed
class TokenModel with _$TokenModel {
  const TokenModel._();
  factory TokenModel({
    required MtgCard mtgCard,
    required int? power,
    required int? toughness,
    @Default(0) int tokenNumber,
    @Default(0) int tappedNumber,
    @Default(0) int prevTappedNumber,
    @Default(0) int weakNumber,
  }) = _TokenModel;

  factory TokenModel.fromMtgCard({
    required MtgCard mtgCard,
  }) =>
      TokenModel(
        mtgCard: mtgCard,
        power: _getValue(mtgCard.power),
        toughness: _getValue(mtgCard.toughness),
      );

  String get id => mtgCard.id;
  List<CardFace>? get cardFaces => mtgCard.cardFaces;
  ImageUris? get imageUris => mtgCard.imageUris;
  String get name => mtgCard.name;

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
