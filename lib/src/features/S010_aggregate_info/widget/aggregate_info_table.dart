import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:token_swarm/src/app/db/provider/token_card_db_list_provider.dart';
import 'package:token_swarm/src/features/S010_aggregate_info/model/info.dart';
import 'package:token_swarm/src/features/S010_aggregate_info/provider/aggregate_info_provider.dart';

class InfoTable extends ConsumerStatefulWidget {
  const InfoTable({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InfoTableState();
}

class _InfoTableState extends ConsumerState<InfoTable> {
  final log = Logger('InfoTable');

  void _onSort(index, asc) {
    log.info('SORT $index, $asc');
    ref.read(sortIndexProvider.notifier).set(index);
    ref.read(ascendingProvider.notifier).set(asc);
    ref.read(aggregateInfoProvider.notifier).sortObjects();
  }

  @override
  Widget build(BuildContext context) {
    List<Info> entries = ref.watch(aggregateInfoProvider);
    int? sortIndex = ref.watch(sortIndexProvider);
    bool isAscending = ref.watch(ascendingProvider);

    void togglePinned(Info elem) {
      log.info('TOGGLE');
      setState(() {});
      ref.read(aggregateInfoProvider.notifier).togglePinned(elem);
    }

    return SingleChildScrollView(
      child: entries.isNotEmpty
          ? DataTable(
              sortColumnIndex: sortIndex,
              sortAscending: isAscending,
              columns: [
                DataColumn(
                  onSort: _onSort,
                  label: const Text(
                    'Type',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  onSort: _onSort,
                  label: const Text(
                    'Count',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: const Text(
                    'Pinned',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              rows: entries
                  .map((e) => DataRow(cells: [
                        DataCell(Text(e.type)),
                        DataCell(Text(e.count.toString())),
                        DataCell(Checkbox(
                          onChanged: (bool? value) {
                            if (value != null) {
                              togglePinned(e);
                            }
                          },
                          value: e.pinned,
                        )),
                      ]))
                  .toList(),
              // List.generate(entries.length, (index) {
              //   log.info('GENERATE');
              //   return DataRow(cells: [
              //     DataCell(Text(entries[index].type)),
              //     DataCell(Text(entries[index].count.toString())),
              //     DataCell(Checkbox(
              //       onChanged: (bool? value) {
              //         if (value != null) {
              //           togglePinned(index);
              //         }
              //       },
              //       value: entries[index].pinned,
              //     )),
              //   ]);
              // }).toList(),
            )
          : const Padding(
              padding: EdgeInsets.all(64.0),
              child: Center(child: Text('Nothing to show here!')),
            ),
    );
  }
}
