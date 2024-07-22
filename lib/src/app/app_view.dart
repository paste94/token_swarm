import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:token_swarm/src/features/home_screen/home_screen.dart';

class AppView extends ConsumerWidget {
  AppView({super.key});

  // https://pub.dev/documentation/go_router/latest/topics/Get%20started-topic.html
  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreenView(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
