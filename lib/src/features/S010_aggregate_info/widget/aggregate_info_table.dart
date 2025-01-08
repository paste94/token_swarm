import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
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
    final entries = ref.watch(aggregateInfoProvider);
    int? sortIndex = ref.watch(sortIndexProvider);
    bool isAscending = ref.watch(ascendingProvider);

    void togglePinned(Info elem) {
      setState(() {});
      ref.read(aggregateInfoProvider.notifier).togglePinned(elem);
    }

    return SingleChildScrollView(
        child: entries.when(
      data: (data) => data.isNotEmpty
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
                const DataColumn(
                  label: Text(
                    'Pinned',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              rows: data
                  .map(
                    (e) => DataRow(
                      color: MaterialStateProperty.resolveWith((state) {
                        return e.pinned
                            ? Theme.of(context).colorScheme.primaryContainer
                            : Theme.of(context).colorScheme.background;
                      }),
                      cells: [
                        DataCell(Text(e.type)),
                        DataCell(Text(e.count.toString())),
                        DataCell(
                          InkWell(
                            onTap: () => togglePinned(e),
                            child: Opacity(
                              opacity: e.pinned ? 1 : 0.25,
                              child: const Icon(
                                Icons.push_pin,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            )
          : const Padding(
              padding: EdgeInsets.all(64.0),
              child: Center(child: Text('Nothing to show here!')),
            ),
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const Center(child: CircularProgressIndicator()),
    ));
  }
}
