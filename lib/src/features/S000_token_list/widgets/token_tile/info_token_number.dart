import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:token_swarm/src/app/const/asset_paths.dart';
import 'package:token_swarm/src/app/db/model/token_card_db.dart';
import 'package:token_swarm/src/app/db/provider/token_card_db_list_provider.dart';
import 'package:token_swarm/src/features/S000_token_list/widgets/token_tile/number_selector.dart';

class InfoTokenNumber extends ConsumerStatefulWidget {
  const InfoTokenNumber(this.token, {super.key});

  final TokenCardDb token;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _InfoTokenNumberState();
}

class _InfoTokenNumberState extends ConsumerState<InfoTokenNumber> {
  @override
  Widget build(BuildContext context) {
    final cardListNotifier = ref.read(tokenCardDbListProvider.notifier);

    return ExpansionTile(
      title: Text('Tot number: ${widget.token.tokenNumber}'),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NumberSelector(
                    title: 'UNtapped',
                    icon: SvgPicture.asset(
                      AssetsPaths.mtgCardUntapped,
                      height: 30,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).iconTheme.color!,
                        BlendMode.srcIn,
                      ),
                    ),
                    numberToShow: widget.token.untappedNumber,
                    handleRemove: () =>
                        cardListNotifier.removeUntapped(token: widget.token),
                    handleAdd: () =>
                        cardListNotifier.addUntapped(token: widget.token),
                  ),
                  NumberSelector(
                    title: 'TAPped',
                    icon: SvgPicture.asset(
                      AssetsPaths.mtgCardTapped,
                      height: 30,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).iconTheme.color!,
                        BlendMode.srcIn,
                      ),
                    ),
                    numberToShow: widget.token.tappedNumber,
                    handleRemove: () =>
                        cardListNotifier.removeTapped(token: widget.token),
                    handleAdd: () =>
                        cardListNotifier.addTapped(token: widget.token),
                  ),
                  widget.token.isCreature
                      ? NumberSelector(
                          title: 'Sick',
                          icon: SvgPicture.asset(
                            AssetsPaths.mtgCardUntapped,
                            height: 30,
                            colorFilter: ColorFilter.mode(
                              Theme.of(context).iconTheme.color!,
                              BlendMode.srcIn,
                            ),
                          ),
                          numberToShow: widget.token.sickNumber,
                          handleRemove: () =>
                              cardListNotifier.removeSick(token: widget.token),
                          handleAdd: () =>
                              cardListNotifier.addSick(token: widget.token),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
