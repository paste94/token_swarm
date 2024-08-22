import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:token_swarm/src/app/const/routes.dart';
import 'package:token_swarm/src/features/home_screen/home_screen.dart';
import 'package:token_swarm/src/features/search_card/search_card.dart';

class AppView extends ConsumerWidget {
  AppView({super.key});

  // https://pub.dev/documentation/go_router/latest/topics/Get%20started-topic.html
  final _router = GoRouter(
    routes: [
      GoRoute(
        path: HOME_ROUTE,
        builder: (context, state) => const HomeScreenView(),
      ),
      GoRoute(
        path: SEARCH_CARD_ROUTE,
        builder: (context, state) => const SearchCardView(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: _router,
      theme: ThemeData(
        iconTheme: IconThemeData(
          color: Colors.black54, // Custom default color for icons
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
    );
  }
}
