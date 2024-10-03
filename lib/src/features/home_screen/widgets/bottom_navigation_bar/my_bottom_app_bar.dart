import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/src/app/const/measures.dart';
import 'package:token_swarm/src/features/home_screen/provider/token_provider.dart';
import 'package:token_swarm/src/features/home_screen/widgets/bottom_navigation_bar/delete_button.dart';
import 'package:token_swarm/src/features/home_screen/widgets/bottom_navigation_bar/tap_button.dart';
import 'package:token_swarm/src/features/home_screen/widgets/bottom_navigation_bar/untap_button.dart';

class MyBottomAppBar extends ConsumerWidget {
  const MyBottomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isTokenSelected = ref.watch(tokenProvider) != null;

    return BottomAppBar(
      child: AnimatedOpacity(
        opacity: isTokenSelected ? 1 : 0,
        duration: const Duration(milliseconds: Timing.fadeAnimation),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DeleteButton(),
            TapButton(),
            UntapButton(),
          ],
        ),
      ),
    );
  }
}
