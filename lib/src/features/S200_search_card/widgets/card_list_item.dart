import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:token_swarm/src/app/common_widgets/token_image_viewer.dart';
import 'package:token_swarm/src/app/const/measures.dart';
import 'package:token_swarm/src/app/const/typography.dart';
import 'package:token_swarm/src/app/db/model/token_card_db.dart';
import 'package:token_swarm/src/app/db/provider/token_card_db_list_provider.dart';
import 'package:token_swarm/src/app/model/token_card2.dart';
import 'package:token_swarm/src/app/provider/token_provider.dart';
import 'package:token_swarm/src/app/routes/routes.dart';

class CardListItem extends ConsumerStatefulWidget {
  const CardListItem({super.key, required this.token});

  final TokenCardDb token;

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
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      );

  void _onCardTap() {
    try {
      ref.read(tokenCardDbListProvider.notifier).insertCard(widget.token);
      context.pop();
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onCardTap,
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
          ],
        ),
      ),
    );
  }
}
