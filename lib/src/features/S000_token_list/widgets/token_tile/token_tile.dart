import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:token_swarm/src/app/const/asset_paths.dart';
import 'package:token_swarm/src/app/db/model/token_card_db.dart';
import 'package:token_swarm/src/app/db/provider/token_card_db_list_provider.dart';
import 'package:token_swarm/src/features/S000_token_list/widgets/token_tile/btn_delete_token.dart';
import 'package:token_swarm/src/features/S000_token_list/widgets/token_tile/number_selector.dart';

class TokenTile extends ConsumerWidget {
  const TokenTile(
    this.token, {
    super.key,
  });

  final TokenCardDb token;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TokenCardDb token = ref.watch(tokenCardDbListProvider).value![index];
    final cardListNotifier = ref.read(tokenCardDbListProvider.notifier);

    return Card(
      child: IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 0,
              child: AspectRatio(
                aspectRatio: 2,
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
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
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
            Flexible(
              flex: 1,
              child: NumberSelector(
                title: 'UNtapped',
                icon: SvgPicture.asset(
                  AssetsPaths.mtgCardUntapped,
                  height: 25,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).iconTheme.color!,
                    BlendMode.srcIn,
                  ),
                ),
                numberToShow: token.untappedNumber,
                handleRemove: () =>
                    cardListNotifier.removeUntapped(token: token),
                handleAdd: () => cardListNotifier.addUntapped(token: token),
              ),
            ),
            Flexible(
              flex: 1,
              child: NumberSelector(
                title: 'TAPped',
                icon: SvgPicture.asset(
                  AssetsPaths.mtgCardTapped,
                  height: 25,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).iconTheme.color!,
                    BlendMode.srcIn,
                  ),
                ),
                numberToShow: token.tappedNumber,
                handleRemove: () => cardListNotifier.removeTapped(token: token),
                handleAdd: () => cardListNotifier.addTapped(token: token),
              ),
            ),
            token.isCreature
                ? Flexible(
                    flex: 1,
                    child: NumberSelector(
                      title: 'Sick',
                      icon: SvgPicture.asset(
                        AssetsPaths.mtgCardUntapped,
                        height: 25,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).iconTheme.color!,
                          BlendMode.srcIn,
                        ),
                      ),
                      numberToShow: token.sickNumber,
                      handleRemove: () =>
                          cardListNotifier.removeSick(token: token),
                      handleAdd: () => cardListNotifier.addSick(token: token),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
