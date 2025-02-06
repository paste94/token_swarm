import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/l10n/generated/app_localizations.dart';
import 'package:token_swarm/src/app/db/model/token_card_db.dart';
import 'package:token_swarm/src/app/db/provider/token_card_db_list_provider.dart';
import 'dart:math' as math;

import 'package:token_swarm/src/features/S400_summary/widgets/summary_item.dart';

class SummaryCardList extends ConsumerWidget {
  const SummaryCardList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(tokenCardDbListProvider);

    onData(List<TokenCardDb>? data) => data!.isEmpty
        ? Center(child: Text(Loc.of(context).pressBtnToAdd))
        : GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 0,
            mainAxisSpacing: 8,
            crossAxisCount: 3,
            children: data
                .map((TokenCardDb element) {
                  return [
                    /// UNTAPPED
                    SummaryItem(
                      image: Image.network(element.imageUri ?? ''),
                      number: element.untappedNumber,
                    ),

                    /// TAPPED
                    SummaryItem(
                      image: Transform.rotate(
                        angle:
                            90 * (math.pi / 180), // Converti gradi in radianti
                        child: Image.network(element.imageUri ?? ''),
                      ),
                      number: element.tappedNumber,
                    ),

                    /// SICK
                    SummaryItem(
                      image: element.isCreature
                          ? ColorFiltered(
                              colorFilter: const ColorFilter.matrix([
                                0.2126, 0.7152, 0.0722, 0, 0, // Rosso
                                0.2126, 0.7152, 0.0722, 0, 0, // Verde
                                0.2126, 0.7152, 0.0722, 0, 0, // Blu
                                0, 0, 0, 1, 0, // Alpha
                              ]),
                              child: Image.network(element.imageUri ?? ''),
                            )
                          : null,
                      number: element.sickNumber,
                    )
                  ];
                })
                .reduce((l1, l2) => l1 + l2)
                .toList()
            // <Widget>[
            //   Container(
            //     padding: const EdgeInsets.all(8),
            //     color: Colors.teal[100],
            //     child: const Text("He'd have you all unravel at the"),
            //   ),
            //   Container(
            //     padding: const EdgeInsets.all(8),
            //     color: Colors.teal[200],
            //     child: const Text('Heed not the rabble'),
            //   ),
            //   Container(
            //     padding: const EdgeInsets.all(8),
            //     color: Colors.teal[300],
            //     child: const Text('Sound of screams but the'),
            //   ),
            //   Container(
            //     padding: const EdgeInsets.all(8),
            //     color: Colors.teal[400],
            //     child: const Text('Who scream'),
            //   ),
            //   Container(
            //     padding: const EdgeInsets.all(8),
            //     color: Colors.teal[500],
            //     child: const Text('Revolution is coming...'),
            //   ),
            //   Container(
            //     padding: const EdgeInsets.all(8),
            //     color: Colors.teal[600],
            //     child: const Text('Revolution, they...'),
            //   ),
            // ],
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
