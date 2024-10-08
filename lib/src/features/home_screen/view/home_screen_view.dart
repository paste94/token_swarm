import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:token_swarm/src/app/const/heroes.dart';
import 'package:token_swarm/src/app/routes/routes.dart';
import 'package:token_swarm/src/app/persistence/provider/persistence.dart';
import 'package:token_swarm/src/features/home_screen/widgets/history_list.dart';
import 'package:token_swarm/src/features/search_card/provider/card_name_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreenView extends ConsumerWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      body: const HistoryView(),
      bottomNavigationBar: const BottomAppBar(),
      floatingActionButton: FloatingActionButton(
        heroTag: HeroesStringTokens.fabToken,
        onPressed: () {
          ref.read(searchCardNameProvider.notifier).setState('');
          context.push(RoutePath.searchCard);
        },
        tooltip: AppLocalizations.of(context)?.addToken ?? 'xxx',
        elevation: 0.0,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
    );
  }
}

class HistoryView extends ConsumerStatefulWidget {
  const HistoryView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HistoryViewState();
}

class _HistoryViewState extends ConsumerState<HistoryView> {
  @override
  void initState() {
    ref.read(persistenceProvider.notifier).get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final historyList = ref.watch(persistenceProvider);

    return Container(
      child: historyList.isNotEmpty
          ? const HistoryList()
          : Center(
              child:
                  Text(AppLocalizations.of(context)?.pressBtnToAdd ?? 'xxx')),
    );
  }
}
