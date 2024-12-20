import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/src/app/db/model/token_card_db.dart';
import 'package:token_swarm/src/app/db/provider/token_card_db_list_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:token_swarm/src/features/S000_token_list/widgets/token_tile/token_tile.dart';

class TokenList extends ConsumerWidget {
  const TokenList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(tokenCardDbListProvider);

    onData(List<TokenCardDb>? data) => data!.isEmpty
        ? Center(
            child: Text(AppLocalizations.of(context)?.pressBtnToAdd ?? 'xxx'))
        : Scrollbar(
            // child: GridView.count(
            //   crossAxisCount: 2,
            //   childAspectRatio: 0.37,
            //   children: data.map((token) => TokenTile(token)).toList(),
            // ),
            child: ListView.separated(
              itemBuilder: (context, i) => InkWell(
                child: TokenTile(data[i]),
              ),
              separatorBuilder: (context, i) => const Divider(
                color: Colors.transparent,
              ),
              itemCount: data.length,
            ),
          );

    return list.when(
      data: onData,
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
