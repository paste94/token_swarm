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
    required String text,
    required String typeLine,
    required List<Color> colorIdentity,
    @Default(0) int tokenNumber,
    @Default(0) int tappedNumber,
    @Default(0) int untappedNumber,
    @Default(0) int prevTappedNumber,
    @Default(0) int sickNumber,
    @Default(false) bool isCreature,
    @Default(false) bool isSicknessActive,
  }) = _TokenCardDb;

  factory TokenCardDb.fromMap(Map<String, dynamic> map) {
    return TokenCardDb(
      id: map['id'] as String,
      power: map['power'] as int?,
      toughness: map['toughness'] as int?,
      imageUri: map['imageUri'] as String?,
      imageUriArtCrop: map['imageUriArtCrop'] as String?,
      name: map['name'] as String,
      text: map['text'] as String,
      typeLine: map['typeLine'] as String,
      colorIdentity: parseColorIdentity(map['colorIdentity']),
      tokenNumber: map['tokenNumber'] as int,
      tappedNumber: map['tappedNumber'] as int,
      untappedNumber: map['untappedNumber'] as int,
      prevTappedNumber: map['prevTappedNumber'] as int,
      sickNumber: map['sickNumber'] as int,
      isCreature: map['isCreature'] as int == 1,
      isSicknessActive: map['isSicknessActive'] as int == 1,
    );
  }

  factory TokenCardDb.fromMtgCard(MtgCard card) {
    return TokenCardDb(
      id: card.id,
      power: parsePT(card.power),
      toughness: parsePT(card.toughness),
      imageUri: _getImageUri(card),
      imageUriArtCrop: _getImageUriArtCrop(card),
      name: card.name,
      text: card.oracleText ?? '',
      isCreature: card.typeLine.contains('Creature'),
      typeLine: card.typeLine,
      colorIdentity: card.colorIdentity,
      isSicknessActive: card.typeLine.contains('Creature'),
    );
  }

  @visibleForTesting
  static int? parsePT(String? value) {
    if (value == null) return null;
    return int.tryParse(value) ?? 0;
  }

  @visibleForTesting
  static List<Color> parseColorIdentity(String colorIdentity) {
    if (colorIdentity.isEmpty) return [];
    return colorIdentity
        .split(',')
        .map((colorName) => Color.values.firstWhere((e) => e.name == colorName))
        .toList();
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
      "text": text,
      "tokenNumber": tokenNumber,
      "tappedNumber": tappedNumber,
      "untappedNumber": untappedNumber,
      "prevTappedNumber": prevTappedNumber,
      "sickNumber": sickNumber,
      "isCreature": isCreature,
      "isSicknessActive": isSicknessActive,
      "typeLine": typeLine,
      "colorIdentity": colorIdentity.map((color) => color.name).join(','),
    };
  }
}
