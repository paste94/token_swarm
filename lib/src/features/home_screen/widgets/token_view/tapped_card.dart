import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/src/features/home_screen/provider/token_provider.dart';

class TappedCard extends ConsumerWidget {
  const TappedCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int tapped = ref.watch(tokenProvider)?.tappedNumber ?? 0;

    return Card(
      semanticContainer: false,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text('Tapped'),
          VerticalDivider(),
          Text('${tapped}'),
        ],
      ),
    );
  }
}
