import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:token_swarm/src/app/model/token_model.dart';

part "mini_token_model.freezed.dart";

/// dart run build_runner build

@freezed
class MiniTokenModel with _$MiniTokenModel {
  const MiniTokenModel._();
  factory MiniTokenModel({
    required String id,
    required String name,
    String? imageUri,
  }) = _MiniTokenModel;

  factory MiniTokenModel.fromMap({
    required Map<String, Object?> map,
  }) =>
      MiniTokenModel(
        id: map['id'].toString(),
        name: map['name'].toString(),
        imageUri: map['image_uri'].toString(),
      );

  factory MiniTokenModel.fromToken(
    TokenModel token,
  ) =>
      MiniTokenModel(
        id: token.id,
        name: token.name,
        imageUri: _getImageUri(token),
      );

  static String _getImageUri(TokenModel token) {
    print('************ token.cardFaces: ${token.cardFaces}');
    print('************ token.cardFaces?[0]: ${token.cardFaces?[0]}');
    print(
        '************ token.cardFaces?[0].imageUris: ${token.cardFaces?[0].imageUris}');
    print(
        '************ token.cardFaces?[0].imageUris?.small: ${token.cardFaces?[0].imageUris?.small}');
    return token.cardFaces?[0].imageUris?.small.toString() ??
        token.imageUris?.small.toString() ??
        '';
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'image_uri': imageUri,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    };
  }
}
