import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/src/app/const/asset_paths.dart';
import 'package:token_swarm/src/app/db/model/token_card_db.dart';
import 'package:token_swarm/src/app/db/provider/token_card_db_list_provider.dart';
import 'package:token_swarm/src/app/text_parser/text_parser.dart';
import 'package:token_swarm/src/features/S000_token_list/widgets/token_tile/elements/btn_delete_token.dart';
import 'package:token_swarm/src/features/S000_token_list/widgets/token_tile/elements/btn_token_action.dart';
import 'package:token_swarm/src/features/S000_token_list/widgets/token_tile/elements/lst_info_token.dart';

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

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Image
          Flexible(
            flex: 0,
            child: AspectRatio(
              aspectRatio: 1.8,
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
              size: 16,
            ),
          ),

          /// Text
          Flexible(
            flex: 2,
            child: token.text != ''
                ? _buildPadding(
                    child: SingleChildScrollView(
                      child: parseTokenText(context, token.text),
                    ),
                    size: 16,
                  )
                : const SizedBox(),
          ),

          /// Info
          Flexible(
            flex: 0,
            child: _buildPadding(
              child: InfoToken(token),
              size: 8,
            ),
          ),

          _buildPadding(
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
                // FilledButton.tonalIcon(
                //   onPressed: () => ref
                //       .read(tokenCardDbListProvider.notifier)
                //       .tap(token: widget.token),
                //   label: Text('Tap'),
                //   icon: Padding(
                //     padding: const EdgeInsets.only(
                //       left: 8,
                //       top: 16,
                //       bottom: 16,
                //     ),
                //     child: SvgPicture.asset(
                //       AssetsPaths.tapIcon,
                //       height: 25,
                //       colorFilter: ColorFilter.mode(
                //         Theme.of(context).iconTheme.color!,
                //         BlendMode.srcIn,
                //       ),
                //     ),
                //   ),
                // ),
                // FilledButton.tonalIcon(
                //   onPressed: () => ref
                //       .read(tokenCardDbListProvider.notifier)
                //       .untap(token: widget.token),
                //   label: Text('Untap'),
                //   icon: Padding(
                //     padding: const EdgeInsets.only(
                //       left: 8,
                //       top: 16,
                //       bottom: 16,
                //     ),
                //     child: SvgPicture.asset(
                //       AssetsPaths.untapIcon,
                //       height: 25,
                //       colorFilter: ColorFilter.mode(
                //         Theme.of(context).iconTheme.color!,
                //         BlendMode.srcIn,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
            size: 16,
          ),
        ],
      ),
    );
  }
}
