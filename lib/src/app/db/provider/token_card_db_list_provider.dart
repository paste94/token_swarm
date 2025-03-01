import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:token_swarm/src/app/db/model/token_card_db.dart';
import 'package:token_swarm/src/app/db/repository/token_card_repository.dart';

part 'token_card_db_list_provider.g.dart';

@riverpod
class TokenCardDbList extends _$TokenCardDbList {
  static final log = Logger('TokenCardDbList');

  @override
  FutureOr<List<TokenCardDb>?> build() async {
    await TokenCardRepository.initDB();
    return _fetch();
  }

  Future<List<TokenCardDb>> _fetch() async {
    try {
      List<Map<String, dynamic>> result =
          await TokenCardRepository.queryToken();
      for (var item in result) {
        log.info(item);
      }
      final tasks = result.map((data) => TokenCardDb.fromMap(data)).toList();
      return tasks;
    } catch (e, stackTrace) {
      log.severe('$e \n $stackTrace');
      return [];
    }
  }

  Future<void> insertCard(TokenCardDb token) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await TokenCardRepository.insertToken(token);
      return _fetch();
    });
  }

  Future<void> deleteCard(TokenCardDb token) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await TokenCardRepository.deleteToken(token);
      return _fetch();
    });
  }

  Future<void> addUntapped({
    required TokenCardDb token,
    int number = 1,
  }) async {
    // state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        await TokenCardRepository.updateToken(
          id: token.id,
          attribute: 'untappedNumber',
          newVal: token.untappedNumber + number,
        );
        await TokenCardRepository.updateToken(
          id: token.id,
          attribute: 'tokenNumber',
          newVal: token.tokenNumber + number,
        );
      } catch (e, stackTrace) {
        log.severe('ERROR: $e \n $stackTrace');
      }
      return _fetch();
    });
  }

  Future<void> removeUntapped({
    required TokenCardDb token,
    int number = 1,
  }) async {
    final newNumber = token.untappedNumber - number;
    if (newNumber >= 0) {
      // state = const AsyncValue.loading();
      state = await AsyncValue.guard(() async {
        try {
          await TokenCardRepository.updateToken(
            id: token.id,
            attribute: 'untappedNumber',
            newVal: newNumber,
          );
          await TokenCardRepository.updateToken(
            id: token.id,
            attribute: 'tokenNumber',
            newVal: token.tokenNumber - number,
          );
        } catch (e, stackTrace) {
          log.severe('ERROR: $e \n $stackTrace');
        }
        return _fetch();
      });
    }
  }

  Future<void> addTapped({
    required TokenCardDb token,
    int number = 1,
  }) async {
    state = await AsyncValue.guard(() async {
      try {
        await TokenCardRepository.updateToken(
          id: token.id,
          attribute: 'tappedNumber',
          newVal: token.tappedNumber + number,
        );
        await TokenCardRepository.updateToken(
          id: token.id,
          attribute: 'tokenNumber',
          newVal: token.tokenNumber + number,
        );
      } catch (e, stackTrace) {
        log.severe('ERROR: $e \n $stackTrace');
      }
      return _fetch();
    });
  }

  Future<void> removeTapped({
    required TokenCardDb token,
    int number = 1,
  }) async {
    final newNumber = token.tappedNumber - number;
    if (newNumber >= 0) {
      state = await AsyncValue.guard(() async {
        try {
          await TokenCardRepository.updateToken(
            id: token.id,
            attribute: 'tappedNumber',
            newVal: newNumber,
          );
          await TokenCardRepository.updateToken(
            id: token.id,
            attribute: 'tokenNumber',
            newVal: token.tokenNumber - number,
          );
        } catch (e, stackTrace) {
          log.severe('ERROR: $e \n $stackTrace');
        }
        return _fetch();
      });
    }
  }

  Future<void> addSick({
    required TokenCardDb token,
    int number = 1,
  }) async {
    state = await AsyncValue.guard(() async {
      try {
        await TokenCardRepository.updateToken(
          id: token.id,
          attribute: 'sickNumber',
          newVal: token.sickNumber + number,
        );
        await TokenCardRepository.updateToken(
          id: token.id,
          attribute: 'tokenNumber',
          newVal: token.tokenNumber + number,
        );
      } catch (e, stackTrace) {
        log.severe('ERROR: $e \n $stackTrace');
      }
      return _fetch();
    });
  }

  Future<void> removeSick({
    required TokenCardDb token,
    int number = 1,
  }) async {
    final newNumber = token.sickNumber - number;
    if (newNumber >= 0) {
      state = await AsyncValue.guard(() async {
        try {
          await TokenCardRepository.updateToken(
            id: token.id,
            attribute: 'sickNumber',
            newVal: newNumber,
          );
          await TokenCardRepository.updateToken(
            id: token.id,
            attribute: 'tokenNumber',
            newVal: token.tokenNumber - number,
          );
        } catch (e, stackTrace) {
          log.severe('ERROR: $e \n $stackTrace');
        }
        return _fetch();
      });
    }
  }

  Future<void> tap({
    required TokenCardDb token,
  }) async {
    if (token.untappedNumber > 0) {
      state = await AsyncValue.guard(() async {
        try {
          await TokenCardRepository.tap(token.id);
        } catch (e, stackTrace) {
          log.severe('ERROR: $e \n $stackTrace');
        }
        return _fetch();
      });
    }
  }

  Future<void> untap({
    required TokenCardDb token,
  }) async {
    if (token.tappedNumber > 0) {
      state = await AsyncValue.guard(() async {
        try {
          await TokenCardRepository.untap(token.id);
        } catch (e, stackTrace) {
          log.severe('ERROR: $e \n $stackTrace');
        }
        return _fetch();
      });
    }
  }

  Future<void> newTurn() async {
    state = await AsyncValue.guard(() async {
      await TokenCardRepository.newTurn();
      return _fetch();
    });
  }

  Future<void> updatePower({
    required TokenCardDb token,
    required int number,
  }) async {
    state = await AsyncValue.guard(() async {
      try {
        await TokenCardRepository.updateToken(
          id: token.id,
          attribute: 'power',
          newVal: number,
        );
      } catch (e, stackTrace) {
        log.severe('ERROR: $e \n $stackTrace');
      }
      return _fetch();
    });
  }

  Future<void> updateToughness({
    required TokenCardDb token,
    required int number,
  }) async {
    state = await AsyncValue.guard(() async {
      try {
        await TokenCardRepository.updateToken(
          id: token.id,
          attribute: 'toughness',
          newVal: number,
        );
      } catch (e, stackTrace) {
        log.severe('ERROR: $e \n $stackTrace');
      }
      return _fetch();
    });
  }
}
