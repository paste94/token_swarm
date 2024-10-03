import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sickness_check_provider.g.dart';

@riverpod
class SicknessCheck extends _$SicknessCheck {
  @override
  bool build() => true;

  void toggle() => state = !state;
}
