import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:token_swarm/src/app/const/routes.dart';
import 'package:token_swarm/src/features/about/about_view.dart';
import 'package:token_swarm/src/features/home_screen/home_screen.dart';
import 'package:token_swarm/src/features/search_card/search_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// flutter gen-l10n

class AppView extends ConsumerWidget {
  AppView({super.key});

  // https://pub.dev/documentation/go_router/latest/topics/Get%20started-topic.html
  final _router = GoRouter(
    routes: [
      GoRoute(
        path: RoutePath.home,
        builder: (context, state) => const HomeScreenView(),
      ),
      GoRoute(
        path: RoutePath.searchCard,
        builder: (context, state) => const SearchCardView(),
      ),
      GoRoute(
        path: RoutePath.about,
        builder: (context, state) => const AboutView(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: _router,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        iconTheme: const IconThemeData(
          color: Colors.black54, // Custom default color for icons
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
    );
  }
}
