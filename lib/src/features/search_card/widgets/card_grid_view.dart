import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scryfall_api/scryfall_api.dart';
import 'package:token_swarm/src/app/const/measures.dart';
import 'package:token_swarm/src/features/search_card/provider/card_name_provider.dart';
import 'package:token_swarm/src/features/search_card/widgets/card_list_item.dart';

class CardGridView extends ConsumerWidget {
  const CardGridView({super.key});
  Widget _onData(PaginableList cardList) => cardList.length > 0
      ? GridView.count(
          crossAxisCount: N_CARDS_FOR_ROW,
          childAspectRatio: CARD_ASPECT_RATIO,
          children:
              cardList.data.map((card) => CardListItem(token: card)).toList(),
        )
      : const Text('Nothing to show here :(');

  Widget _onLoading() => const Center(child: CircularProgressIndicator());

  Widget _onError(err, s) =>
      err is ScryfallException ? Text(err.details) : Text(err.toString());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardList = ref.watch(fetchCardsProvider);
    return cardList.when(
      data: _onData,
      error: _onError,
      loading: _onLoading,
    );
  }
}
