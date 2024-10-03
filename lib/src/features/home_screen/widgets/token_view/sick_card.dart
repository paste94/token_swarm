import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/src/app/common_widgets/mtg_card_image_viewer.dart';
import 'package:token_swarm/src/app/const/asset_paths.dart';
import 'package:token_swarm/src/features/home_screen/home_widgets.dart';
import 'package:token_swarm/src/features/home_screen/provider/token_provider.dart';

class SickCard extends ConsumerWidget {
  const SickCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int sick = ref.watch(tokenProvider)?.sickNumber ?? 0;
    var token = ref.watch(tokenProvider);
    String imageUri = token?.cardFaces?[0].imageUris?.normal.toString() ??
        token?.imageUris?.normal.toString() ??
        '';

    return Card(
      semanticContainer: false,
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: imageUri,
            progressIndicatorBuilder: (_, __, ___) => const Image(
              image: AssetImage(AssetsPaths.mtgRear),
            ),
            errorWidget: (_, __, ___) => const SizedBox(
              child: Icon(Icons.image_not_supported),
            ),
          ),
          const Expanded(child: Text('Sick')),
          IconButton(
            onPressed: () => ref.read(tokenProvider.notifier).removeSick(),
            icon: const Icon(Icons.remove),
          ),
          Text('$sick'),
          IconButton(
            onPressed: () => ref.read(tokenProvider.notifier).addSick(),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
