import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/src/app/provider/token_provider.dart';

class UntapButton extends ConsumerWidget {
  const UntapButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isTokenSelected = ref.watch(tokenProvider) != null;

    return IconButton(
      icon: const Icon(Icons.fast_forward_rounded),
      onPressed:
          isTokenSelected ? ref.read(tokenProvider.notifier).untapAll : null,
      tooltip: 'New turn',
    );
  }
}
