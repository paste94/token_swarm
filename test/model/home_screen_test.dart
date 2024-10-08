import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:token_swarm/src/features/home_screen/home_screen.dart';
import 'package:token_swarm/src/app/provider/token_provider.dart';

/// https://blog.logrocket.com/automated-testing-flutter/

void main() {
  testWidgets('Tests positioning of FAB in initial home screen',
      (tester) async {
    await tester.pumpWidget(const ProviderScope(child: HomeScreenView()));
    final fab = tester.element(find.byType(FloatingActionButton));
    final container = ProviderScope.containerOf(fab);

    expect(
      container.read(tokenProvider),
      'some value',
    );
  });
}
