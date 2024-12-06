import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:token_swarm/src/app/common_widgets/settings_menu_buttons.dart';
import 'package:token_swarm/src/app/const/asset_paths.dart';
import 'package:token_swarm/src/app/const/heroes.dart';
import 'package:token_swarm/src/app/db/provider/token_card_db_list_provider.dart';
import 'package:token_swarm/src/app/routes/routes.dart';
import 'package:token_swarm/src/features/S010_aggregate_info/widget/aggregate_info_table.dart';
import 'package:token_swarm/src/features/S000_token_list/widgets/token_list.dart';
import 'package:token_swarm/src/features/S200_search_card/provider/card_name_provider.dart';

class TokenListView extends ConsumerWidget {
  const TokenListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.appName ?? 'xxx'),
        actions: const [
          SettingsMenuButtons(),
        ],
      ),
      body: const TokenList(),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(
              onPressed: () =>
                  ref.read(tokenCardDbListProvider.notifier).newTurn(),
              icon: SvgPicture.asset(
                AssetsPaths.untapIcon,
                height: 20,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).iconTheme.color!,
                  BlendMode.srcIn,
                ),
              ),
            ),
            IconButton(
              onPressed: () async {
                await showModalBottomSheet(
                    showDragHandle: true,
                    context: context,
                    builder: (context) {
                      return const FractionallySizedBox(
                        widthFactor: 1,
                        child: InfoTable(),
                      );
                    });
              },
              icon: const Icon(Icons.info),
            )
          ],
        ),
      ),
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
