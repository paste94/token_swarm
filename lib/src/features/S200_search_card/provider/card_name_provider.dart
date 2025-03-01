import 'dart:io';

import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scryfall_api/scryfall_api.dart';
import 'package:token_swarm/src/app/db/model/token_card_db.dart';
import 'package:token_swarm/src/features/S200_search_card/provider/exceptions/card_name_exception.dart';

part 'card_name_provider.g.dart';

/// dart run build_runner build

final apiClient = ScryfallApiClient();
final log = Logger('SearchCardNameProvider');

@riverpod
class SearchCardName extends _$SearchCardName {
  @override
  String build() {
    return '';
  }

  setState(String val) {
    state = val;
  }
}

@Riverpod()
Future<PaginableList<TokenCardDb>> fetchCards(ref) async {
  try {
    final cardName = ref.watch(searchCardNameProvider);
    if (cardName.isEmpty || cardName.length < 2) {
      return PaginableList(data: [], hasMore: false);
    }
    final cardList = await apiClient.searchCards(cardName, includeExtras: true);
    final filteredCardList = PaginableList(
      data: cardList.data
          .where((element) => element.typeLine.contains('Token'))
          .map((e) => TokenCardDb.fromMtgCard(e))
          .toList(),
      hasMore: true,
    );
    return filteredCardList;
  } catch (e, stackTrace) {
    if (e is ScryfallException) {
      return PaginableList(data: [], hasMore: false);
    } else if (e is SocketException) {
      throw CardNameException(
        details: 'SocketException: ${e.message}',
        message: 'Please check your internet connection and retry',
      );
    } else {
      log.severe(stackTrace);
      rethrow;
    }
  }
}
