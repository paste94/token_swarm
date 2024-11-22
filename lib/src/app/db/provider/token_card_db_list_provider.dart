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
      List<Map<String, dynamic>> result = await TokenCardRepository.query();
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
      await TokenCardRepository.insert(token);
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
        log.info('1');
        await TokenCardRepository.update(
          id: token.id,
          attribute: 'untappedNumber',
          newVal: token.untappedNumber + number,
        );
        log.info('2');

        await TokenCardRepository.update(
          id: token.id,
          attribute: 'tokenNumber',
          newVal: token.tokenNumber + number,
        );
      } catch (e, stackTrace) {
        log.severe('ERROR: $e \n $stackTrace');
      }
      log.info('3');

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
          await TokenCardRepository.update(
            id: token.id,
            attribute: 'untappedNumber',
            newVal: newNumber,
          );
          await TokenCardRepository.update(
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
}
