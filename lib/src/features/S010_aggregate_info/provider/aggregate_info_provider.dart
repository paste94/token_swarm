import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:token_swarm/src/app/db/provider/token_card_db_list_provider.dart';
import 'package:token_swarm/src/app/db/repository/token_card_repository.dart';
import 'package:token_swarm/src/features/S010_aggregate_info/model/info.dart';

part 'aggregate_info_provider.g.dart';

@riverpod
class SortIndex extends _$SortIndex {
  @override
  int? build() {
    return null;
  }

  void set(int v) => state = v;
}

@riverpod
class Ascending extends _$Ascending {
  @override
  bool build() {
    return true;
  }

  void set(bool b) => state = b;
}

@riverpod
class AggregateInfo extends _$AggregateInfo {
  final log = Logger('aggregateInfoProvider');

  @override
  FutureOr<List<Info>> build() async {
    log.info('BUILD');
    await TokenCardRepository.initDB();
    return await _fetch();
  }

  Future<List<Info>> _fetch() async {
    List<Info> l = [];
    final settingsData = await TokenCardRepository.queryAggInfo();

    try {
      final list = ref.read(tokenCardDbListProvider).value;
      if (list != null) {
        List<String> completeTypes = list.map((e) => e.typeLine).toList();
        List<String> complexTypes = list
            .map((e) => e.typeLine.replaceAll('Token', '').split('—'))
            .reduce((value, element) => value + element)
            .map((e) => e.trim())
            .toSet()
            .toList();
        List<String> simpleTypes = list
            .map((e) => e.typeLine.replaceAll('Token', '').split(' '))
            .reduce((value, element) => value + element)
            .toSet()
            .toList()
          ..removeWhere((item) => item == '—')
          ..removeWhere((item) => item == '');
        List<String> types =
            (completeTypes + complexTypes + simpleTypes).toSet().toList();

        for (final t in types) {
          int count = 0;
          for (var token in list) {
            if (token.typeLine.contains(t)) {
              count += token.tokenNumber;
            }
          }
          log.info(settingsData);
          bool pinned = settingsData
                      .where((element) => element['type'] == t)
                      .firstOrNull?['pinned'] ==
                  1
              ? true
              : false;
          l.add(
            Info(
              type: t,
              count: count,
              pinned: pinned,
            ),
          );
        }
      }

      for (final elem in l) {
        TokenCardRepository.insertAggInfo(elem.type, elem.pinned);
      }

      return l;
    } catch (e, stackTrace) {
      print(stackTrace);
      return l;
    }
  }

  Future<void> togglePinned(Info elem) async {
    if (state.value != null) {
      log.info('[togglePinned]: $elem');
      state = await AsyncValue.guard(() async {
        await TokenCardRepository.updateAggInfo(
          type: elem.type,
          attribute: 'pinned',
          newVal: !elem.pinned,
        );
        return _fetch();
      });
      sortObjects();
    }
  }

  void sortObjects() {
    if (state.value != null) {
      int? sortIndex = ref.read(sortIndexProvider);
      bool isAscending = ref.read(ascendingProvider);
      state.value!.sort((a, b) {
        if (a.pinned != b.pinned) {
          return a.pinned ? -1 : 1;
        }
        if (sortIndex == 0) {
          return isAscending
              ? a.type.compareTo(b.type)
              : b.type.compareTo(a.type);
        } else {
          return isAscending
              ? a.count.compareTo(b.count)
              : b.count.compareTo(a.count);
        }
      });
    }
  }
}
