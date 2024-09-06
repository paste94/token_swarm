import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:token_swarm/src/app/model/token_card.dart';

part "token_preview.freezed.dart";

/// dart run build_runner build

@freezed
class TokenPreview with _$TokenPreview {
  const TokenPreview._();
  factory TokenPreview({
    required String id,
    required String name,
    String? imageUri,
  }) = _TokenPreview;

  factory TokenPreview.fromMap({
    required Map<String, Object?> map,
  }) =>
      TokenPreview(
        id: map['id'].toString(),
        name: map['name'].toString(),
        imageUri: map['image_uri'].toString(),
      );

  factory TokenPreview.fromToken(TokenCard token) => TokenPreview(
        id: token.id,
        name: token.name,
        imageUri: _getImageUri(token),
      );

  static String _getImageUri(TokenCard token) =>
      token.cardFaces?[0].imageUris?.small.toString() ??
      token.imageUris?.small.toString() ??
      '';

  Map<String, Object?> toMap() => {
        'id': id,
        'name': name,
        'image_uri': imageUri,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      };
}
