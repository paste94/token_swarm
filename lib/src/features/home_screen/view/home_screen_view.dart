import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:token_swarm/src/app/const/heroes.dart';
import 'package:token_swarm/src/app/const/measures.dart';
import 'package:token_swarm/src/features/home_screen/provider/token_provider.dart';
import 'package:token_swarm/src/features/home_screen/widgets/number_selector.dart';
import 'package:token_swarm/src/features/home_screen/widgets/tapped_selector.dart';
import 'package:token_swarm/src/features/home_screen/widgets/token_viewer.dart';

class HomeScreenView extends ConsumerWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var token = ref.watch(tokenProvider);
    bool isTokenSelected = ref.watch(tokenProvider) != null;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SingleChildScrollView(
        // child: AnimatedSwitcher(
        //   duration: const Duration(milliseconds: FADE_ANIMATION_MS),
        child: isTokenSelected
            ? Container(
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
              )
            : Container(
                key: UniqueKey(),
                child: const Center(
                  child: Text('Press + button to add a token'),
                ),
              ),
      ),
      // ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // IconButton(
            //   onPressed: () {},
            //   // icon: SvgPicture.asset('assets/single_card.svg'),
            //   icon: Transform.rotate(
            //     angle: 90 * pi / 180,
            //     child: const Icon(Icons.crop_3_2),
            //   ),
            // ),
            // if (_visible)
            AnimatedOpacity(
              opacity: isTokenSelected ? 1 : 0,
              duration: const Duration(milliseconds: FADE_ANIMATION_MS),
              child: IconButton(
                onPressed: isTokenSelected
                    ? () {
                        ref.read(tokenProvider.notifier).removeToken();
                      }
                    : null,
                icon: const Icon(Icons.delete),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: SEARCH_TOKEN_HERO_FAB,
        onPressed: () => context.push('/search_card'),
        tooltip: 'Add New Item',
        elevation: 0.0,
        child: Icon(
          isTokenSelected ? Icons.refresh : Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      // floatingActionButton: AnimatedSlide(
      //   duration: const Duration(milliseconds: 200),
      //   offset: _showFab ? Offset.zero : const Offset(0, 2),
      //   child: AnimatedOpacity(
      //     duration: const Duration(milliseconds: 200),
      //     opacity: _showFab ? 1 : 0,
      //     child: FloatingActionButton(
      //       child: const Icon(Icons.add),
      //       onPressed: () {
      //         context.push('/search_card');
      //       },
      //     ),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
