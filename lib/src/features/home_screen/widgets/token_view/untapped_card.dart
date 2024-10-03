import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/src/features/home_screen/provider/token_provider.dart';

class UntappedCard extends ConsumerWidget {
  const UntappedCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int untapped = ref.watch(tokenProvider)?.untappedNumber ?? 0;

    return Card(
      semanticContainer: false,
      child: Row(
        children: [
          const Text('Untapped'),
          const VerticalDivider(),
          IconButton(
            onPressed: () => ref.read(tokenProvider.notifier).removeUntapped(),
            icon: const Icon(Icons.remove),
          ),
          Text('$untapped'),
          IconButton(
            onPressed: () => ref.read(tokenProvider.notifier).addUntapped(),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
