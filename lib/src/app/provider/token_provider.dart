import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scryfall_api/scryfall_api.dart';
import 'package:token_swarm/src/app/model/token_preview.dart';
import 'package:token_swarm/src/app/model/token_card2.dart';
import 'package:token_swarm/src/app/persistence/provider/persistence.dart';

part 'token_provider.g.dart';

/// dart run build_runner build

@Riverpod(keepAlive: true)
class Token extends _$Token {
  final apiClient = ScryfallApiClient();

  @override
  TokenCard? build() {
    return null;
  }

  void setToken(TokenCard token) {
    state = token;
    ref
        .read(persistenceProvider.notifier)
        .insert(TokenPreview.fromToken(token));
  }

  Future<void> setTokenFromId(String id) async {
    final card = await apiClient.getCardById(id);
    final token = TokenCard.fromMtgCard(card);
    setToken(token);
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

  void addSick({int number = 1}) {
    if (state == null) {
      return;
    }
    state = state!.copyWith(
      sickNumber: state!.sickNumber + number,
      tokenNumber: state!.tokenNumber + number,
    );
  }

  void addUntapped({int number = 1}) {
    if (state == null) {
      return;
    }
    state = state!.copyWith(
      untappedNumber: state!.untappedNumber + number,
      tokenNumber: state!.tokenNumber + number,
    );
  }

  void addTapped({int number = 1}) {
    if (state == null) {
      return;
    }
    state = state!.copyWith(
      tappedNumber: state!.tappedNumber + number,
      tokenNumber: state!.tokenNumber + number,
    );
  }

  void removeSick({int number = 1}) {
    if (state == null) {
      return;
    }
    if (state!.sickNumber - number >= 0) {
      state = state!.copyWith(
        sickNumber: state!.sickNumber - number,
        tokenNumber: state!.tokenNumber - number,
      );
    }
  }

  void removeUntapped({int number = 1}) {
    if (state == null) {
      return;
    }
    if (state!.untappedNumber - number >= 0) {
      state = state!.copyWith(
        untappedNumber: state!.untappedNumber - number,
        tokenNumber: state!.tokenNumber - number,
      );
    }
  }

  void removeTapped({int number = 1}) {
    if (state == null) {
      return;
    }
    if (state!.tappedNumber - number >= 0) {
      state = state!.copyWith(
        tappedNumber: state!.tappedNumber - number,
        tokenNumber: state!.tokenNumber - number,
      );
    }
  }

  void upkeep() {
    if (state == null) {
      return;
    }
    int n = state!.sickNumber + state!.tappedNumber;
    state = state!.copyWith(
      sickNumber: 0,
      tappedNumber: 0,
      untappedNumber: state!.untappedNumber + n,
    );
  }

  void newTurn() {
    if (state == null) {
      return;
    }
    int newUntappedNumber =
        state!.sickNumber + state!.untappedNumber + state!.tappedNumber;
    state = state!.copyWith(
      sickNumber: 0,
      untappedNumber: newUntappedNumber,
      tappedNumber: 0,
    );
  }

  void tap({int number = 1}) {
    if (state == null) {
      return;
    }
    if (state!.untappedNumber - number >= 0) {
      state = state!.copyWith(
        untappedNumber: state!.untappedNumber - number,
        tappedNumber: state!.tappedNumber + number,
      );
    }
  }

  void untap({int number = 1}) {
    if (state == null) {
      return;
    }
    if (state!.tappedNumber - number >= 0) {
      state = state!.copyWith(
        tappedNumber: state!.tappedNumber - number,
        untappedNumber: state!.untappedNumber + number,
      );
    }
  }
}
