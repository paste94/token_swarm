import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/src/app/const/typography.dart';
import 'package:token_swarm/src/features/home_screen/provider/token_provider.dart';

class Summary extends ConsumerWidget {
  const Summary({super.key});

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
