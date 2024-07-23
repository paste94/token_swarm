import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:token_swarm/src/features/home_screen/provider/token_provider.dart';
import 'package:token_swarm/src/features/home_screen/widgets/number_selector.dart';
import 'package:token_swarm/src/features/home_screen/widgets/tapped_selector.dart';
import 'package:token_swarm/src/features/home_screen/widgets/token_viewer.dart';

class HomeScreenView extends ConsumerWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var token = ref.watch(tokenProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SingleChildScrollView(
        child: token != null
            ? const Column(children: [
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
              ])
            : const Center(
                child: Text('Press + button to add a token'),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.push('/search_card');
        },
      ),
    );
  }
}
