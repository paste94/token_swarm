import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/src/app/common_widgets/mtg_card_image_viewer.dart';
import 'package:token_swarm/src/app/provider/token_provider.dart';
import 'package:token_swarm/src/features/home_screen/widgets/old/power_toughness.dart';

class TokenViewer extends ConsumerWidget {
  const TokenViewer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final token = ref.watch(tokenProvider);
    return Column(
      children: [
        MtgCardImageViewer(myCard: token),
        const PowerToughness(),
      ],
    );
  }
}
