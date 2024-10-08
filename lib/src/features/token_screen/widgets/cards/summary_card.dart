import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/src/app/const/typography.dart';
import 'package:token_swarm/src/app/provider/token_provider.dart';

class SummaryCard extends ConsumerWidget {
  const SummaryCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int tot = ref.watch(tokenProvider)?.tokenNumber ?? 0;

    return Column(
      children: [
        Text(
          'TOT: $tot',
          style: MyTypography.h2,
        )
      ],
    );
  }
}
