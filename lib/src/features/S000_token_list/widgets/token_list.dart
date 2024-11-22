import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/src/app/const/asset_paths.dart';
import 'package:token_swarm/src/app/db/model/token_card_db.dart';
import 'package:token_swarm/src/app/db/provider/token_card_db_list_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TokenList extends ConsumerWidget {
  const TokenList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(tokenCardDbListProvider);

    onData(List<TokenCardDb>? data) => data!.isEmpty
        ? Center(
            child: Text(AppLocalizations.of(context)?.pressBtnToAdd ?? 'xxx'))
        : Scrollbar(
            child: ListView.separated(
              itemBuilder: (context, i) => InkWell(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: CachedNetworkImage(
                              imageUrl: data[i].imageUri!,
                              progressIndicatorBuilder: (_, __, ___) =>
                                  const Image(
                                image: AssetImage(AssetsPaths.mtgRear),
                              ),
                              errorWidget: (_, __, ___) => const SizedBox(
                                child: Icon(Icons.image_not_supported),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 3,
                            child: Center(
                              child: IntrinsicWidth(
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: Text(
                                        data[i].name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                    ),
                                    Flexible(
                                      flex: 3,
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Flexible(
                                              flex: 4,
                                              child: IconButton.filledTonal(
                                                onPressed: () => ref
                                                    .read(
                                                        tokenCardDbListProvider
                                                            .notifier)
                                                    .removeUntapped(
                                                        token: data[i]),
                                                icon: const Icon(Icons.remove),
                                              ),
                                            ),
                                            const Flexible(
                                              flex: 1,
                                              child: SizedBox(width: 16),
                                            ),
                                            Flexible(
                                              flex: 4,
                                              child: Text(
                                                '${data[i].tokenNumber}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge,
                                              ),
                                            ),
                                            const Flexible(
                                              flex: 1,
                                              child: SizedBox(width: 16),
                                            ),
                                            Flexible(
                                              flex: 4,
                                              child: IconButton.filledTonal(
                                                onPressed: () => ref
                                                    .read(
                                                        tokenCardDbListProvider
                                                            .notifier)
                                                    .addUntapped(
                                                        token: data[i]),
                                                icon: const Icon(Icons.add),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              separatorBuilder: (context, i) => const Divider(
                height: 0,
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
