import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/src/app/common_widgets/token_image_viewer.dart';
import 'package:token_swarm/src/app/provider/token_provider.dart';
import 'package:token_swarm/src/features/token_screen/widgets/actions/add_button.dart';
import 'package:token_swarm/src/features/token_screen/widgets/actions/number_viewer.dart';
import 'package:token_swarm/src/features/token_screen/widgets/actions/remove_button.dart';

class SickCard extends ConsumerWidget {
  const SickCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int sick = ref.watch(tokenProvider)?.sickNumber ?? 0;

    return Card(
      semanticContainer: false,
      child: Row(
        children: [
          ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Colors.grey,
              BlendMode.saturation,
            ),
            // child: TokenImageViewer(token: ref.watch(tokenProvider)!),
          ),
          const Expanded(child: Center(child: Text('Sick'))),
          Column(
            children: [
              const Expanded(child: Divider()),
              AddButton(
                onPressed: ref.read(tokenProvider.notifier).addSick,
              ),
              NumberViewer(number: sick),
              RemoveButton(
                onPressed: ref.read(tokenProvider.notifier).removeSick,
              ),
              const Expanded(child: Divider()),
            ],
          ),
        ],
      ),
    );
  }
}
