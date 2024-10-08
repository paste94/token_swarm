import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/src/app/common_widgets/token_image_viewer.dart';
import 'package:token_swarm/src/features/home_screen/provider/token_provider.dart';
import 'package:token_swarm/src/features/home_screen/widgets/token_view/cards_widgets/add_button.dart';
import 'package:token_swarm/src/features/home_screen/widgets/token_view/cards_widgets/number_viewer.dart';
import 'package:token_swarm/src/features/home_screen/widgets/token_view/cards_widgets/remove_button.dart';

class SickCard extends ConsumerWidget {
  const SickCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int sick = ref.watch(tokenProvider)?.sickNumber ?? 0;

    return Card(
      semanticContainer: false,
      child: Row(
        children: [
          const ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.grey,
              BlendMode.saturation,
            ),
            child: TokenImageViewer(),
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
