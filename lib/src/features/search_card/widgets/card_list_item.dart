import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:token_swarm/src/app/common_widgets/mtg_card_image_viewer.dart';
import 'package:token_swarm/src/app/const/measures.dart';
import 'package:token_swarm/src/app/model/token_card.dart';
import 'package:token_swarm/src/features/home_screen/provider/token_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CardListItem extends ConsumerStatefulWidget {
  const CardListItem({super.key, required this.token});

  final TokenCard token;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CardListItemState();
}

class _CardListItemState extends ConsumerState<CardListItem> {
  Widget _cardImage() => MtgCardImageViewer(
        myCard: widget.token,
        borderRadius: const BorderRadius.all(
          Radius.circular(SearchCardConstants.cardBorderRadius),
        ),
      );

  Widget _cardName() => Padding(
        padding: const EdgeInsets.only(left: ConstPadding.padding),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(widget.token.name),
        ),
      );

  Widget _selectButton() => TextButton(
        onPressed: () {
          try {
            ref.read(tokenProvider.notifier).setToken(widget.token);
            context.pop();
          } catch (e) {
            final snackBar = SnackBar(content: Text(e.toString()));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: Text(AppLocalizations.of(context)?.select ?? 'xxx'),
      );

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(SearchCardConstants.cardBorderRadius),
        ),
      ),
      child: Column(
        children: [
          IntrinsicHeight(
            child: _cardImage(),
          ),
          IntrinsicHeight(
            child: _cardName(),
          ),
          IntrinsicHeight(
            child: _selectButton(),
          ),
        ],
      ),
    );
  }
}
