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
        imageUri: token.imageUris?.small.toString(),
      );

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'image_uri': imageUri,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    };
  }
}
