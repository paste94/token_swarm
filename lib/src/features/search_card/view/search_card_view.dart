import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/src/app/const/heroes.dart';
import 'package:token_swarm/src/features/search_card/widgets/card_grid_view.dart';
import 'package:token_swarm/src/features/search_card/widgets/card_search_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchCardView extends ConsumerWidget {
  const SearchCardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.searchCard ?? 'xxx'),
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
