import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/src/features/home_screen/home_widgets.dart';

class TokenView extends ConsumerWidget {
  const TokenView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Container(
        key: UniqueKey(),
        child: const Column(
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(child: Center(child: NumberSelector())),
                  VerticalDivider(width: 1.0),
                  Expanded(child: Center(child: TappedSelector())),
                ],
              ),
            ),
            IntrinsicHeight(child: TokenViewer()),
          ],
        ),
      ),
    );
  }
}
