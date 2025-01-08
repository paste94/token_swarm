import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/src/app/provider/token_provider.dart';
import 'package:token_swarm/src/features/token_screen/widgets/actions/add_button.dart';
import 'package:token_swarm/src/features/token_screen/widgets/actions/number_viewer.dart';
import 'package:token_swarm/src/features/token_screen/widgets/actions/remove_button.dart';

class UntappedCard extends ConsumerWidget {
  const UntappedCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int untapped = ref.watch(tokenProvider)?.untappedNumber ?? 0;

    return Card(
      semanticContainer: false,
      child: Row(
        children: [
          // TokenImageViewer(token: ref.watch(tokenProvider)!),
          const Expanded(child: Center(child: Text('Untapped'))),
          Column(
            children: [
              const Expanded(child: Divider()),
              AddButton(
                onPressed: ref.read(tokenProvider.notifier).addUntapped,
              ),
              NumberViewer(number: untapped),
              RemoveButton(
                onPressed: ref.read(tokenProvider.notifier).removeUntapped,
              ),
              const Expanded(child: Divider()),
            ],
          ),
        ],
      ),
    );
  }
}
