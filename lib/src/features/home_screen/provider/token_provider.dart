import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scryfall_api/scryfall_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:token_swarm/src/features/home_screen/provider/state/token_state.dart';

part 'token_provider.g.dart';

/// dart run build_runner build

@Riverpod(keepAlive: true)
class Token extends _$Token {
  @override
  TokenState? build() {
    return null;
  }

  void setToken(MtgCard token) {
    int? power;
    int? toughness;
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

    _persistData(token.id);
  }

  void _persistData(String tokenId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var l = prefs.getStringList('last_saved');
      if (l != null) {
        if (l.length >= 10) {
          l.removeAt(0);
        }
        l.add(tokenId);
      } else {
        l = [tokenId];
      }
      await prefs.setStringList('last_saved', l);
    } catch (e) {
      print(e);
    }
  }

  void setTokenNumber(int newVal) {
    if (state == null) {
      return;
    }
    state = state!.copyWith(
      tokenNumber: newVal,
    );
  }

  void setTappedNumber(int newVal) {
    if (state == null) {
      return;
    }
    if (newVal > state!.tokenNumber) {
      newVal = state!.tokenNumber;
    }
    state = state!.copyWith(
      tappedNumber: newVal,
    );
  }

  /// Increases the number of tapped tokens given a number of tokens to tap
  void increaseTapped(int val) {
    if (state == null) {
      return;
    }
    if (state!.tappedNumber + val <= state!.tokenNumber) {
      state = state!.copyWith(
        tappedNumber: state!.tappedNumber + val,
      );
    }
  }

  /// Decreases the number of tapped tokens given a number of tokens to untap
  void decreaseTapped(int val) {
    if (state == null || state!.tappedNumber == 0) {
      return;
    }
    final newVal = state!.tappedNumber - val;
    state = state!.copyWith(
      tappedNumber: newVal >= 0 ? newVal : 0,
    );
  }

  /// Increases the number of tokens given a number of tokens to add
  void increaseNumber(int val) {
    if (state == null) {
      return;
    }
    state = state!.copyWith(
      tokenNumber: state!.tokenNumber + val,
    );
  }

  /// Decreases the number of tokens given a number of tokens to remove
  void decreaseNumber(int val) {
    if (state == null || state!.tokenNumber == 0) {
      return;
    }
    final newVal = state!.tokenNumber - val < 0 ? 0 : state!.tokenNumber - val;
    state = state!.copyWith(
      tokenNumber: newVal,
    );
    if (newVal < state!.tappedNumber) {
      state = state!.copyWith(
        tappedNumber: newVal,
      );
    }
  }

  void newTurn() {
    if (state == null) {
      return;
    }
    state = state!.copyWith(
      tappedNumber: 0,
      weakNumber: 0,
    );
  }

  void setPower(int newVal) {
    if (state == null) {
      return;
    }
    state = state!.copyWith(power: newVal);
  }

  void setToughness(int newVal) {
    if (state == null) {
      return;
    }
    state = state!.copyWith(toughness: newVal);
  }

  Future removeToken() async {
    state = null;
  }

  void untapAll() {
    state = state!.copyWith(tappedNumber: 0);
  }
}
