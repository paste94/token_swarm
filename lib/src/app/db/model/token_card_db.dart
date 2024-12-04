import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scryfall_api/scryfall_api.dart';

part 'token_card_db.freezed.dart';

/// dart run build_runner build

@freezed
class TokenCardDb with _$TokenCardDb {
  const TokenCardDb._();
  factory TokenCardDb({
    required String id,
    required int? power,
    required int? toughness,
    required String? imageUri,
    required String? imageUriArtCrop,
    required String name,
    @Default(0) int tokenNumber,
    @Default(0) int tappedNumber,
    @Default(0) int untappedNumber,
    @Default(0) int prevTappedNumber,
    @Default(0) int sickNumber,
    @Default(false) bool isCreature,
  }) = _TokenCardDb;

  factory TokenCardDb.fromMap(Map<String, dynamic> map) {
    return TokenCardDb(
      id: map['id'] as String,
      power: map['power'] as int?,
      toughness: map['toughness'] as int?,
      imageUri: map['imageUri'] as String?,
      imageUriArtCrop: map['imageUriArtCrop'] as String?,
      name: map['name'] as String,
      tokenNumber: map['tokenNumber'] as int,
      tappedNumber: map['tappedNumber'] as int,
      untappedNumber: map['untappedNumber'] as int,
      prevTappedNumber: map['prevTappedNumber'] as int,
      sickNumber: map['sickNumber'] as int,
      isCreature: map['isCreature'] as int == 1,
    );
  }

  factory TokenCardDb.fromMtgCard(MtgCard card) {
    return TokenCardDb(
      id: card.id,
      power: card.power != null ? int.parse(card.power!) : null,
      toughness: card.toughness != null ? int.parse(card.toughness!) : null,
      imageUri: _getImageUri(card),
      imageUriArtCrop: _getImageUriArtCrop(card),
      name: card.name,
      isCreature: card.typeLine.contains('Creature'),
    );
  }

  static String? _getImageUri(MtgCard card) =>
      card.cardFaces?[0].imageUris?.normal.toString() ??
      card.imageUris?.normal.toString();

  static String? _getImageUriArtCrop(MtgCard card) =>
      card.cardFaces?[0].imageUris?.artCrop.toString() ??
      card.imageUris?.artCrop.toString();

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "power": power,
      "toughness": toughness,
      "imageUri": imageUri,
      "imageUriArtCrop": imageUriArtCrop,
      "name": name,
      "tokenNumber": tokenNumber,
      "tappedNumber": tappedNumber,
      "untappedNumber": untappedNumber,
      "prevTappedNumber": prevTappedNumber,
      "sickNumber": sickNumber,
      "isCreature": isCreature,
    };
  }
}
