import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scryfall_api/scryfall_api.dart';
import 'package:token_swarm/src/app/common_widgets/alert_card.dart';
import 'package:token_swarm/src/app/const/measures.dart';
import 'package:token_swarm/src/app/db/model/token_card_db.dart';
import 'package:token_swarm/src/features/S200_search_card/provider/card_name_provider.dart';
import 'package:token_swarm/src/features/S200_search_card/provider/exceptions/card_name_exception.dart';
import 'package:token_swarm/src/features/S200_search_card/widgets/card_list_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CardGridView extends ConsumerStatefulWidget {
  const CardGridView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CardGridViewState();
}

class _CardGridViewState extends ConsumerState<CardGridView> {
  Widget _onData(PaginableList<TokenCardDb> cardList) => cardList.length > 0
      ? GridView.count(
          crossAxisCount: SearchCardConstants.nCardsForRow,
          childAspectRatio: SearchCardConstants.cardAspectRatio,
          children:
              cardList.data.map((token) => CardListItem(token: token)).toList(),
        )
      : AlertCard(
          iconText: AppLocalizations.of(context)?.noCardsFound ?? 'xxx',
          title: AppLocalizations.of(context)?.attention ?? 'xxx',
          text: AppLocalizations.of(context)?.noCardsFoundDetails ?? 'xxx',
          color: Colors.green[300],
          icon: Icons.search_off,
          iconColor: Colors.black54,
        );

  Widget _onLoading() => const Center(child: CircularProgressIndicator());

  Widget _onError(err, s) => AlertCard(
        iconText: AppLocalizations.of(context)?.noInternet ?? 'xxx',
        title: AppLocalizations.of(context)?.attention ?? 'xxx',
        text: err is CardNameException
            ? err.message
            : AppLocalizations.of(context)?.unknownError ?? 'xxx',
        color: Colors.red[300],
        icon: Icons.cloud_off,
        iconColor: Colors.white,
      );

  @override
  Widget build(BuildContext context) {
    final cardList = ref.watch(fetchCardsProvider);
    return cardList.when(
      data: _onData,
      error: _onError,
      loading: _onLoading,
    );
  }
}
