import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/src/app/const/asset_paths.dart';
import 'package:token_swarm/src/app/const/measures.dart';
import 'package:token_swarm/src/app/model/token_card2.dart';

class TokenImageViewer extends ConsumerWidget {
  const TokenImageViewer({super.key, required this.token});

  final TokenCard token;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String imageUri = token.cardFaces?[0].imageUris?.normal.toString() ??
        token.imageUris?.normal.toString() ??
        '';

    print('????????????????? $imageUri ??????????????????');

    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(SearchCardConstants.cardBorderRadius),
      ),
      child: CachedNetworkImage(
        imageUrl: imageUri,
        progressIndicatorBuilder: (_, __, ___) => const Image(
          image: (AssetImage(AssetsPaths.mtgRear)),
        ),
        errorWidget: (_, __, ___) => const SizedBox(
          child: Icon(Icons.image_not_supported),
        ),
      ),
    );
  }
}
