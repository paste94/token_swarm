import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scryfall_api/scryfall_api.dart';
import 'package:token_swarm/src/features/home_screen/provider/state/token_state.dart';

part 'token_provider.g.dart';

@riverpod
class Token extends _$Token {
  @override
  TokenState? build() {
    return null;
  }

  void setToken(MtgCard token) {
    state = TokenState(selectedToken: token);
  }

  void setTokenNumber(int newVal) {
    state = state?.copyWith(tokenNumber: newVal);
  }

  void setTappedNumber(int newVal) {
    state = state?.copyWith(tokenNumber: newVal);
  }
}
