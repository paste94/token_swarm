import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/l10n/generated/app_localizations.dart';
import 'package:token_swarm/src/app/const/heroes.dart';
import 'package:token_swarm/src/features/S200_search_card/widgets/card_grid_view.dart';
import 'package:token_swarm/src/features/S200_search_card/widgets/card_search_bar.dart';

class SearchCardView extends ConsumerWidget {
  const SearchCardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Loc.of(context).searchCard),
      ),
      body: const Hero(
        tag: HeroesStringTokens.fabToken,
        child: Column(
          children: [
            IntrinsicHeight(child: CardSearchBar()),
            Divider(color: Colors.transparent),
            Expanded(child: CardGridView()),
          ],
        ),
      ),
    );
  }
}
