import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/src/app/common_widgets/token_image_viewer.dart';
import 'package:token_swarm/src/app/const/measures.dart';
import 'package:token_swarm/src/features/home_screen/provider/token_provider.dart';
import 'package:token_swarm/src/features/home_screen/widgets/token_view/cards_widgets/add_button.dart';
import 'package:token_swarm/src/features/home_screen/widgets/token_view/cards_widgets/number_viewer.dart';
import 'package:token_swarm/src/features/home_screen/widgets/token_view/cards_widgets/remove_button.dart';

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
          LayoutBuilder(
            builder: (context, constraints) {
              double parentHeight = constraints.maxHeight;
              return SizedBox(
                height: parentHeight,
                width: parentHeight,
                child: const RotatedBox(
                  quarterTurns: 1,
                  child: TokenImageViewer(),
                ),
              );
            },
          ),
          const Expanded(child: Center(child: Text('Tapped'))),
          Column(
            children: [
              const Expanded(child: Divider()),
              AddButton(
                onPressed: ref.read(tokenProvider.notifier).addTapped,
              ),
              NumberViewer(number: tapped),
              RemoveButton(
                onPressed: ref.read(tokenProvider.notifier).removeTapped,
              ),
              const Expanded(child: Divider()),
            ],
          ),
        ],
      ),
    );
  }
}