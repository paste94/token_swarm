import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:token_swarm/src/app/common_widgets/settings_menu_buttons.dart';
import 'package:token_swarm/src/app/const/heroes.dart';
import 'package:token_swarm/src/app/routes/routes.dart';
import 'package:token_swarm/src/app/provider/token_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:token_swarm/src/features/S200_search_card/provider/card_name_provider.dart';
import 'package:token_swarm/src/features/token_screen/widgets/bottom_navigation_bar/token_bottom_app_bar.dart';
import 'package:token_swarm/src/features/token_screen/widgets/token_widgets.dart';

class TokenScreenView extends ConsumerWidget {
  const TokenScreenView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var token = ref.watch(tokenProvider)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(token.name),
        actions: const [
          SettingsMenuButtons(),
        ],
      ),
      body: const Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          IntrinsicHeight(child: SummaryCard()),
          Expanded(child: SickCard()),
          Expanded(child: UntappedCard()),
          IntrinsicHeight(child: ActionsCard()),
          Expanded(child: TappedCard()),
        ],
      ),
      bottomNavigationBar: const TokenBottomAppBar(),
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
