import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:token_swarm/src/app/const/asset_paths.dart';
import 'package:token_swarm/src/app/db/model/token_card_db.dart';
import 'package:token_swarm/src/app/db/provider/token_card_db_list_provider.dart';
import 'package:token_swarm/src/features/S000_token_list/widgets/token_tile/elements/crd_number_selector.dart';

/// TODO: Turn it to a stateless widget
class InfoToken extends ConsumerStatefulWidget {
  const InfoToken(this.token, {super.key});

  final TokenCardDb token;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InfoTokenState();
}

class _InfoTokenState extends ConsumerState<InfoToken> {
  Widget _buildNumberSelector({
    required String title,
    required String assetPath,
    required int numberToShow,
    required void Function() handleRemove,
    required void Function() handleAdd,
    Color? iconColor,
  }) {
    return NumberSelector(
      title: title,
      icon: SvgPicture.asset(
        assetPath,
        height: 30,
        colorFilter: ColorFilter.mode(
          iconColor ?? Theme.of(context).iconTheme.color!,
          BlendMode.srcIn,
        ),
      ),
      numberToShow: numberToShow,
      handleRemove: handleRemove,
      handleAdd: handleAdd,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cardListNotifier = ref.read(tokenCardDbListProvider.notifier);

    return Column(
      children: [
        /// Untapped
        _buildNumberSelector(
          title: 'UNTapped',
          assetPath: AssetsPaths.mtgCardUntapped,
          numberToShow: widget.token.untappedNumber,
          handleRemove: () =>
              cardListNotifier.removeUntapped(token: widget.token),
          handleAdd: () => cardListNotifier.addUntapped(token: widget.token),
        ),

        /// Tapped
        _buildNumberSelector(
          title: 'TAPped',
          assetPath: AssetsPaths.mtgCardTapped,
          numberToShow: widget.token.tappedNumber,
          handleRemove: () =>
              cardListNotifier.removeTapped(token: widget.token),
          handleAdd: () => cardListNotifier.addTapped(token: widget.token),
        ),

        /// Sick
        if (widget.token.isSicknessActive)
          _buildNumberSelector(
            title: 'Sick',
            assetPath: AssetsPaths.mtgCardUntapped,
            numberToShow: widget.token.sickNumber,
            handleRemove: () =>
                cardListNotifier.removeSick(token: widget.token),
            handleAdd: () => cardListNotifier.addSick(token: widget.token),
            iconColor:
                Theme.of(context).iconTheme.color!.withValues(alpha: 0.25),
          ),
      ],
    );
  }
}
