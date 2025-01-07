import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/l10n/generated/app_localizations.dart';
import 'package:token_swarm/src/app/routes/routes.dart';

// flutter gen-l10n

class AppView extends ConsumerWidget {
  AppView({super.key});

  final _router = RoutePath.goRouter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: _router,
      localizationsDelegates: Loc.localizationsDelegates,
      supportedLocales: Loc.supportedLocales,
      theme: ThemeData(
        iconTheme: const IconThemeData(
          color: Colors.black54,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
    );
  }
}
