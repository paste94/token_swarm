import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

part 'settings_provider.g.dart';

/// dart run build_runner build

@Riverpod(keepAlive: true)
class AlwaysOnDisplay extends _$AlwaysOnDisplay {
  final String _alwaysOnString = 'alwaysOn';

  @override
  FutureOr<bool> build() async {
    return _fetch();
  }

  Future<bool> _fetch() async {
    var prefs = await SharedPreferences.getInstance();
    bool isAlwaysOnActive = prefs.getBool(_alwaysOnString) ?? false;
    if (isAlwaysOnActive) {
      WakelockPlus.enable();
    } else {
      WakelockPlus.disable();
    }
    return prefs.getBool(_alwaysOnString) ?? false;
  }

  Future<void> toggle() async {
    state = await AsyncValue.guard(() async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool(_alwaysOnString, !(state.value ?? false));
      return _fetch();
    });
  }
}
