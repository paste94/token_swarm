import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:token_swarm/src/app/common_widgets/mtg_card_image_viewer.dart';
import 'package:token_swarm/src/app/common_widgets/token_image_viewer.dart';
import 'package:token_swarm/src/app/const/measures.dart';
import 'package:token_swarm/src/app/const/typography.dart';
import 'package:token_swarm/src/app/model/token_card2.dart';
import 'package:token_swarm/src/app/provider/token_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:token_swarm/src/app/routes/routes.dart';

class CardListItem extends ConsumerStatefulWidget {
  const CardListItem({super.key, required this.token});

  final TokenCard token;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CardListItemState();
}

class _CardListItemState extends ConsumerState<CardListItem> {
  Widget _cardImage() => TokenImageViewer(token: widget.token);

  Widget _cardName() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          widget.token.name,
          style: MyTypography.h3,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      );

  // Widget _selectButton() => FilledButton(
  //       onPressed: () {
  //         try {
  //           ref.read(tokenProvider.notifier).setToken(widget.token);
  //           context.pop();
  //         } catch (e) {
  //           final snackBar = SnackBar(content: Text(e.toString()));
  //           ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //         }
  //       },
  //       child: Text(AppLocalizations.of(context)?.select ?? 'xxx'),
  //     );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        try {
          ref.read(tokenProvider.notifier).setToken(widget.token);
          context.replace(RoutePath.token);
        } catch (e) {
          final snackBar = SnackBar(content: Text(e.toString()));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: Card(
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
            // IntrinsicHeight(
            //   child: Row(
            //     children: [
            //       const Expanded(child: Divider(color: Colors.transparent)),
            //       IntrinsicWidth(
            //           child: Padding(
            //         child: _selectButton(),
            //         padding: EdgeInsets.only(right: ConstPadding.padding),
            //       )),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
