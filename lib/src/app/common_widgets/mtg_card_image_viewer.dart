import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scryfall_api/scryfall_api.dart';
import 'package:token_swarm/src/app/const/measures.dart';

class MtgCardImageViewer extends ConsumerStatefulWidget {
  const MtgCardImageViewer({
    super.key,
    this.myCard,
    this.borderRadius = BorderRadius.zero,
  });
  final MtgCard? myCard;
  final BorderRadiusGeometry borderRadius;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MtgCardImageViewerState();
}

class _MtgCardImageViewerState extends ConsumerState<MtgCardImageViewer> {
  int face = 0;
  bool isSingleSided = true;

  void flipCardImage() {
    setState(() => face = (face + 1) % 2);
  }

  @override
  Widget build(BuildContext context) {
    isSingleSided = widget.myCard?.cardFaces?[face].imageUris == null;

    String imageUri =
        widget.myCard?.cardFaces?[face].imageUris?.normal.toString() ??
            widget.myCard?.imageUris?.normal.toString() ??
            '';

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          children: [
            IntrinsicHeight(
              child: ClipRRect(
                borderRadius: widget.borderRadius,
                child: CachedNetworkImage(
                  imageUrl: imageUri,
                  progressIndicatorBuilder: (_, __, ___) => const Image(
                    image: AssetImage('assets/mtg_rear.jpg'),
                  ),
                  errorWidget: (_, __, ___) => const SizedBox(
                    child: Icon(Icons.image_not_supported),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 6),
              child: Divider(color: Colors.transparent),
            ),
          ],
        ),
        Positioned(
          child: Visibility(
            visible: !isSingleSided,
            child: CircleAvatar(
              radius: CIRCLE_AVATAR_BUTTON_SIZE,
              backgroundColor: Theme.of(context).primaryColor,
              child: IconButton(
                onPressed: flipCardImage,
                icon: const Icon(
                  Icons.flip_camera_android,
                  size: CIRCLE_AVATAR_BUTTON_SIZE,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
