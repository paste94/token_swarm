import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scryfall_api/scryfall_api.dart';
import 'package:token_swarm/src/features/search_card/provider/exceptions/card_name_exception.dart';

/// dart run build_runner build
part 'card_name_provider.g.dart';

final apiClient = ScryfallApiClient();

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

@Riverpod(keepAlive: true)
Future<PaginableList<MtgCard>> fetchCards(ref) async {
  try {
    final cardName = ref.watch(searchCardNameProvider);
    if (cardName.isEmpty || cardName.length < 2) {
      return PaginableList(data: [], hasMore: false);
    }
    final cardList = await apiClient.searchCards(cardName, includeExtras: true);
    final filteredCardList = PaginableList(
      data: cardList.data
          .where((element) => element.typeLine.contains('Token'))
          .toList(),
      hasMore: true,
    );
    return filteredCardList;
  } catch (e) {
    if (e is ScryfallException) {
      return PaginableList(data: [], hasMore: false);
    } else if (e is SocketException) {
      throw CardNameException(
        details: 'SocketException: ${e.message}',
        message: 'Please check your internet connection and retry',
      );
    } else {
      throw const CardNameException();
    }
  }
}
