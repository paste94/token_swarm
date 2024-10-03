import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/src/features/home_screen/widgets/token_view/sick_card.dart';
import 'package:token_swarm/src/features/home_screen/widgets/token_view/summary.dart';
import 'package:token_swarm/src/features/home_screen/widgets/token_view/tap_actions.dart';
import 'package:token_swarm/src/features/home_screen/widgets/token_view/tapped_card.dart';
import 'package:token_swarm/src/features/home_screen/widgets/token_view/untapped_card.dart';

class TokenView extends ConsumerWidget {
  const TokenView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        IntrinsicHeight(
          child: Summary(),
        ),
        Expanded(
          child: SickCard(),
        ),
        Expanded(
          child: UntappedCard(),
        ),
        IntrinsicHeight(
          child: TapActions(),
        ),
        Expanded(
          child: TappedCard(),
        ),
      ],
    );
  }
}
