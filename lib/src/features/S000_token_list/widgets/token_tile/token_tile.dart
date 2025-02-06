import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/src/app/const/asset_paths.dart';
import 'package:token_swarm/src/app/db/model/token_card_db.dart';
import 'package:token_swarm/src/app/db/provider/token_card_db_list_provider.dart';
import 'package:token_swarm/src/app/text_parser/text_parser.dart';
import 'package:token_swarm/src/app/functions/get_color.dart';
import 'package:token_swarm/src/features/S000_token_list/widgets/token_tile/elements/token_tile_widgets.dart';

class TokenTile extends ConsumerWidget {
  const TokenTile(
    this.token, {
    super.key,
  });

  final TokenCardDb token;

  Widget _buildPadding({required Widget child, required double size}) {
    return Padding(
      padding: EdgeInsets.only(top: size, left: size, right: size),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final cardListNotifier = ref.read(tokenCardDbListProvider.notifier);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: getColors(context, token.colorIdentity),
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          // color: getColor(token.colorIdentity.firstOrNull) ??
          //     Theme.of(context).colorScheme.surfaceContainer,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image
              Flexible(
                flex: 0,
                child: AspectRatio(
                  aspectRatio: 1.9,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: token.imageUriArtCrop ?? '',
                      fit: BoxFit.cover,
                      progressIndicatorBuilder: (_, __, ___) => const Image(
                        image: AssetImage(AssetsPaths.mtgRear),
                      ),
                      errorWidget: (_, __, ___) => const SizedBox(
                        child: Icon(Icons.image_not_supported),
                      ),
                    ),
                  ),
                ),
              ),

              /// Name
              Flexible(
                flex: 2,
                child: _buildPadding(
                  size: 16,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          token.name,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                      BtnDeleteToken(token: token),
                    ],
                  ),
                ),
              ),

              /// Text
              Flexible(
                flex: 2,
                child: token.text != ''
                    ? _buildPadding(
                        size: 16,
                        child: SingleChildScrollView(
                          child: parseTokenText(context, token.text),
                        ),
                      )
                    : const SizedBox(),
              ),

              /// Info
              Flexible(
                flex: 0,
                child: _buildPadding(
                  size: 8,
                  child: InfoToken(token),
                ),
              ),

              _buildPadding(
                size: 16,
                child: Row(
                  children: [
                    /// TAP Action
                    BtnTokenAction(
                      onTap: () => ref
                          .read(tokenCardDbListProvider.notifier)
                          .tap(token: token),
                      label: 'Tap',
                      iconPath: AssetsPaths.tapIcon,
                    ),

                    /// Divider
                    const SizedBox(width: 16),

                    /// UNTAP Action
                    BtnTokenAction(
                      onTap: () => ref
                          .read(tokenCardDbListProvider.notifier)
                          .untap(token: token),
                      label: 'Untap',
                      iconPath: AssetsPaths.untapIcon,
                    ),

                    const Expanded(
                      child: SizedBox(),
                    ),
                    BtnPowerThoughness(token: token),
                  ],
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
