import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/src/app/const/heroes.dart';
import 'package:token_swarm/src/features/search_card/widgets/card_grid_view.dart';
import 'package:token_swarm/src/features/search_card/widgets/card_search_bar.dart';

class SearchCardView extends ConsumerWidget {
  const SearchCardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Card'),
      ),
      body: const Hero(
        tag: HeroesStringTokens.searchHeroFab,
        child: Column(
          children: [
            IntrinsicHeight(child: CardSearchBar()),
            Expanded(child: CardGridView()),
          ],
        ),
      ),
    );
  }
}
