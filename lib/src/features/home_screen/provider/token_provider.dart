import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scryfall_api/scryfall_api.dart';
import 'package:token_swarm/src/features/home_screen/provider/exception/token_provider_exception.dart';
import 'package:token_swarm/src/features/home_screen/provider/state/token_state.dart';

part 'token_provider.g.dart';

@riverpod
class Token extends _$Token {
  @override
  TokenState? build() {
    return null;
  }

  void setToken(MtgCard token) {
    int? power;
    int? toughness;
    print('********** ${token.power}/${token.toughness}');
    if (token.power == null) {
      power = null;
    } else {
      try {
        power = int.parse(token.power!);
      } catch (e) {
        power = 0;
      }
    }
    if (token.toughness == null) {
      toughness = null;
    } else {
      try {
        toughness = int.parse(token.toughness!);
      } catch (e) {
        toughness = 0;
      }
    }

    state = TokenState(
      selectedToken: token,
      power: power,
      toughness: toughness,
    );
  }

  void setTokenNumber(int newVal) {
    if (state != null) {
      state = state!.copyWith(
        tokenNumber: newVal,
      );
    }
  }

  void setTappedNumber(int newVal) {
    if (state != null) {
      state = state!.copyWith(
        tappedNumber: newVal,
      );
    }
  }

  void newTurn() {
    if (state != null) {
      state = state!.copyWith(
        tappedNumber: 0,
        weakNumber: 0,
      );
    }
  }

  void setPower(int newVal) {
    if (state != null) {
      state = state!.copyWith(power: newVal);
    }
  }

  void setToughness(int newVal) {
    if (state != null) {
      state = state!.copyWith(toughness: newVal);
    }
  }
}
