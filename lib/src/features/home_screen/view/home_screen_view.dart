import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:token_swarm/src/features/home_screen/provider/token_provider.dart';
import 'package:token_swarm/src/features/home_screen/widgets/number_selector.dart';
import 'package:token_swarm/src/features/home_screen/widgets/tapped_selector.dart';
import 'package:token_swarm/src/features/home_screen/widgets/token_viewer.dart';

class HomeScreenView extends ConsumerStatefulWidget {
  const HomeScreenView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends ConsumerState<HomeScreenView> {
  bool _showFab = true;

  @override
  Widget build(BuildContext context) {
    var token = ref.watch(tokenProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          final ScrollDirection direction = notification.direction;
          setState(() {
            if (direction == ScrollDirection.reverse) {
              _showFab = false;
            } else if (direction == ScrollDirection.forward) {
              _showFab = true;
            }
          });
          return true;
        },
        child: SingleChildScrollView(
          child: token != null
              ? const Column(
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
                )
              : const Center(
                  child: Text('Press + button to add a token'),
                ),
        ),
      ),
      floatingActionButton: AnimatedSlide(
        duration: const Duration(milliseconds: 200),
        offset: _showFab ? Offset.zero : const Offset(0, 2),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: _showFab ? 1 : 0,
          child: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              context.push('/search_card');
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
