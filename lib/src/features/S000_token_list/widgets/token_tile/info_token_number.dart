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
      title: Row(
        children: [
          SvgPicture.asset(
            AssetsPaths.mtgCardUntapped,
            height: 25,
            colorFilter: ColorFilter.mode(
              Theme.of(context).iconTheme.color!,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(width: 8),
          Text('${widget.token.untappedNumber}'),
          SizedBox(width: 32),
          SvgPicture.asset(
            AssetsPaths.mtgCardTapped,
            height: 25,
            colorFilter: ColorFilter.mode(
              Theme.of(context).iconTheme.color!,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(width: 8),
          Text('${widget.token.tappedNumber}'),
          SizedBox(width: 32),
          widget.token.isCreature
              ? SvgPicture.asset(
                  AssetsPaths.mtgCardUntapped,
                  height: 25,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).iconTheme.color!.withOpacity(0.25),
                    BlendMode.srcIn,
                  ),
                )
              : SizedBox(),
          SizedBox(width: 8),
          widget.token.isCreature
              ? Text('${widget.token.sickNumber}')
              : SizedBox(),
        ],
      ),
      // Text('Tot number: ${widget.token.tokenNumber}'),
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
                  if (widget.token.isSicknessActive)
                    NumberSelector(
                      title: 'Sick',
                      icon: SvgPicture.asset(
                        AssetsPaths.mtgCardUntapped,
                        height: 30,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).iconTheme.color!.withOpacity(0.25),
                          BlendMode.srcIn,
                        ),
                      ),
                      numberToShow: widget.token.sickNumber,
                      handleRemove: () =>
                          cardListNotifier.removeSick(token: widget.token),
                      handleAdd: () =>
                          cardListNotifier.addSick(token: widget.token),
                    )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    // SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.tonalIcon(
                        onPressed: () => ref
                            .read(tokenCardDbListProvider.notifier)
                            .tap(token: widget.token),
                        label: Text('Tap'),
                        icon: Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                            top: 16,
                            bottom: 16,
                          ),
                          child: SvgPicture.asset(
                            AssetsPaths.tapIcon,
                            height: 25,
                            colorFilter: ColorFilter.mode(
                              Theme.of(context).iconTheme.color!,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: widget.token.isSicknessActive ? 32 : 8,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.tonalIcon(
                        onPressed: () => ref
                            .read(tokenCardDbListProvider.notifier)
                            .untap(token: widget.token),
                        label: Text('Untap'),
                        icon: Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                            top: 16,
                            bottom: 16,
                          ),
                          child: SvgPicture.asset(
                            AssetsPaths.untapIcon,
                            height: 25,
                            colorFilter: ColorFilter.mode(
                              Theme.of(context).iconTheme.color!,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
