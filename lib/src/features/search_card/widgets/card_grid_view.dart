import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scryfall_api/scryfall_api.dart';
import 'package:token_swarm/src/app/common_widgets/alert_card.dart';
import 'package:token_swarm/src/app/const/measures.dart';
import 'package:token_swarm/src/app/model/token_model.dart';
import 'package:token_swarm/src/features/search_card/provider/card_name_provider.dart';
import 'package:token_swarm/src/features/search_card/provider/exceptions/card_name_exception.dart';
import 'package:token_swarm/src/features/search_card/widgets/card_list_item.dart';

class CardGridView extends ConsumerWidget {
  const CardGridView({super.key});
  Widget _onData(PaginableList<TokenModel> cardList) => cardList.length > 0
      ? GridView.count(
          crossAxisCount: SearchCardConstants.nCardsForRow,
          childAspectRatio: SearchCardConstants.cardAspectRatio,
          children:
              cardList.data.map((token) => CardListItem(token: token)).toList(),
        )
      : AlertCard(
          iconText: 'No cards found!',
          title: 'Attention!',
          text: 'Search did not make any result :(',
          color: Colors.green[300],
          icon: Icons.search_off,
          iconColor: Colors.black54,
        );

  Widget _onLoading() => const Center(child: CircularProgressIndicator());

  Widget _onError(err, s) => AlertCard(
        iconText: 'No internet!',
        title: 'Attention!',
        text: err is CardNameException ? err.message : 'Unknown error occurred',
        color: Colors.red[300],
        icon: Icons.cloud_off,
        iconColor: Colors.white,
      );

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
