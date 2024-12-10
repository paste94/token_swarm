import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/src/app/routes/routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// flutter gen-l10n

class AppView extends ConsumerWidget {
  AppView({super.key});

  final _router = RoutePath.goRouter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: _router,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
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
