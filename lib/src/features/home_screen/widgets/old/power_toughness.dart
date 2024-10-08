import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/src/app/const/heroes.dart';
import 'package:token_swarm/src/app/const/measures.dart';
import 'package:token_swarm/src/app/const/typography.dart';
import 'package:token_swarm/src/app/provider/token_provider.dart';
import 'package:token_swarm/src/features/home_screen/home_widgets.dart';

class PowerToughness extends ConsumerWidget {
  const PowerToughness({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final token = ref.watch(tokenProvider);

    return token?.power == null || token?.toughness == null
        ? const Divider(
            color: Colors.transparent,
          )
        : Align(
            alignment: Alignment.topRight,
            widthFactor: 4.5,
            child: GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const EditStatsDialog();
                    });
              },
              child: Hero(
                tag: HeroesStringTokens.powerToughnessDialog,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: ConstPadding.doublePadding,
                    ),
                    child: Text(
                      '${token?.power ?? 0}/${token?.toughness ?? 0}',
                      style: MyTypography.h2,
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
