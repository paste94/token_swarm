import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:token_swarm/src/app/db/provider/token_card_db_list_provider.dart';
import 'package:token_swarm/src/features/S010_aggregate_info/model/aggregate_info.dart';

@riverpod
List<AggregateInfo> aggregateInfoProvider(WidgetRef ref) {
  final log = Logger('aggregateInfoProvider');

  /// Returns
  ///
  /// []
  List<AggregateInfo> l = [];
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
        l.add(AggregateInfo(type: t, count: count, pinned: false));
      }
    }
    return l;
  } catch (e) {
    log.severe(e);
    return l;
  }
}
