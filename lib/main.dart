import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/src/app/app_view.dart';
import 'package:token_swarm/src/app/observers/my_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ProviderScope(
      observers: [LogObserver()],
      child: AppView(),
    ),
  );
}
