import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/src/app/common_widgets/dialogs/edit_stats_dialog.dart';
import 'package:token_swarm/src/app/const/heroes.dart';
import 'package:token_swarm/src/app/const/measures.dart';
import 'package:token_swarm/src/app/db/model/token_card_db.dart';

class BtnPowerThoughness extends ConsumerWidget {
  const BtnPowerThoughness({super.key, required this.token});

  final TokenCardDb token;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return token.isCreature
        ? GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return EditStatsDialog(token: token);
                  });
            },
            child: Hero(
              tag: HeroesStringTokens.powerToughnessDialog,
              child: Card.outlined(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: ConstPadding.doublePadding,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${token.power} / ${token.toughness}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
              ),
            ),
          )
        : SizedBox();
  }
}
