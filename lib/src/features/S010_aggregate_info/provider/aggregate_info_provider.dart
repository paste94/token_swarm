import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:token_swarm/src/app/db/provider/token_card_db_list_provider.dart';
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
  List<Info> build() {
    log.info('BOULD');
    return getInfo();
  }

  List<Info> getInfo() {
    List<Info> l = [];
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
          l.add(Info(type: t, count: count, pinned: false));
        }
      }
      return l;
    } catch (e) {
      log.severe(e);
      return l;
    }
  }

  void togglePinned(Info elem) {
    int index = state.indexWhere((item) => item.type == elem.type);

    var s = state;
    s[index].pinned = !s[index].pinned;
    state = s;
    log.info(state);
  }

  void sortObjects() {
    int? sortIndex = ref.read(sortIndexProvider);
    bool isAscending = ref.read(ascendingProvider);
    state.sort((a, b) {
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
