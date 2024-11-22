import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:token_swarm/src/app/app_view.dart';
import 'package:token_swarm/src/app/observers/my_observer.dart';

// flutter gen-l10n

Future<void> main() async {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    final text = '${record.time} [${record.loggerName}]: ${record.message}';
    if (kDebugMode) {
      switch (record.level) {
        case Level.INFO:
          print('\x1B[32m$text\x1B[0m');
        case Level.WARNING:
          print('\x1B[33m$text\x1B[0m');
        case Level.SEVERE:
          print('\x1B[31m$text\x1B[0m');
      }
    }
  });
  runApp(
    ProviderScope(
      observers: [LogObserver()],
      child: AppView(),
    ),
  );
}
