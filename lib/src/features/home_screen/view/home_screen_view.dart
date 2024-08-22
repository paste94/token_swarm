import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
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
                child: const Column(children: [
                  Center(
                    child: Text('Press + button to add a token'),
                  ),
                ]),
              ),
      ),
      // ),
      bottomNavigationBar: BottomAppBar(
        child: AnimatedOpacity(
          opacity: isTokenSelected ? 1 : 0,
          duration: const Duration(milliseconds: FADE_ANIMATION_MS),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: isTokenSelected
                    ? () => showDialog(
                          context: context,
                          builder: (builder) => AlertDialog(
                              title: const Text('Delete token?'),
                              content: const SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Text(
                                        'Do you really want to delete this token?'),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Cancel'),
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                                TextButton(
                                  child: const Text('Delete'),
                                  onPressed: () => ref
                                      .read(tokenProvider.notifier)
                                      .removeToken()
                                      .then((value) =>
                                          Navigator.of(context).pop()),
                                ),
                              ]),
                        )
                    : null,
                icon: const Icon(Icons.delete),
              ),
              IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/Mana/Q_reversed.svg',
                  height: 19,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).iconTheme.color!,
                    BlendMode.srcIn,
                  ),
                ),
                onPressed: () => ref.read(tokenProvider.notifier).untapAll(),
              ),
            ],
          ),
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
    );
  }
}
