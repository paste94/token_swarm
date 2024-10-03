import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:token_swarm/src/app/const/heroes.dart';
import 'package:token_swarm/src/app/const/routes.dart';
import 'package:token_swarm/src/features/home_screen/provider/token_provider.dart';
import 'package:token_swarm/src/features/home_screen/view/history_view.dart';
import 'package:token_swarm/src/features/home_screen/view/token_view.dart';
import 'package:token_swarm/src/features/home_screen/widgets/bottom_navigation_bar/my_bottom_app_bar.dart';
import 'package:token_swarm/src/features/search_card/provider/card_name_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreenView extends ConsumerWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isTokenSelected = ref.watch(tokenProvider) != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.appName ?? 'xxx'),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 0,
                child: Text(AppLocalizations.of(context)?.about ?? 'xxx'),
              )
            ],
            onSelected: (value) {
              switch (value) {
                case 0:
                  context.push(RoutePath.about);
              }
            },
          )
        ],
      ),
      body: isTokenSelected ? const TokenView() : const HistoryView(),
      bottomNavigationBar: const MyBottomAppBar(),
      floatingActionButton: FloatingActionButton(
        heroTag: HeroesStringTokens.searchHeroFab,
        onPressed: () {
          ref.read(searchCardNameProvider.notifier).setState('');
          context.push(RoutePath.searchCard);
        },
        tooltip: AppLocalizations.of(context)?.addToken ?? 'xxx',
        elevation: 0.0,
        child: Icon(
          isTokenSelected ? Icons.search : Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
    );
  }
}
