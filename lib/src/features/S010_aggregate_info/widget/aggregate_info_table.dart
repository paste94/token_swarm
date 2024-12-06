import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:token_swarm/src/app/db/provider/token_card_db_list_provider.dart';
import 'package:token_swarm/src/features/S010_aggregate_info/model/aggregate_info.dart';
import 'package:token_swarm/src/features/S010_aggregate_info/provider/aggregate_info_provider.dart';

class InfoTable extends ConsumerStatefulWidget {
  const InfoTable({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InfoTableState();
}

class _InfoTableState extends ConsumerState<InfoTable> {
  // Stato per ordinamento
  int? _sortColumnIndex;
  bool _isAscending = true;

  void _onSort(columnIndex, ascending) {
    setState(() {
      _sortColumnIndex = columnIndex;
      _isAscending = ascending;
    });
  }

  final log = Logger('InfoTable');

  @override
  Widget build(BuildContext context) {
    List<AggregateInfo> entries = aggregateInfoProvider(ref);

    if (_sortColumnIndex != null) {
      if (_sortColumnIndex == 0) {
        // Ordina per chiave
        entries.sort((a, b) =>
            _isAscending ? a.type.compareTo(b.type) : b.type.compareTo(a.type));
        log.info(entries);
      } else if (_sortColumnIndex == 1) {
        // Ordina per valore
        entries.sort((a, b) => _isAscending
            ? a.count.compareTo(b.count)
            : b.count.compareTo(a.count));
        log.info(entries);
      }
    }

    return SingleChildScrollView(
      child: entries.isNotEmpty
          ? DataTable(
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _isAscending,
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
              rows: entries.map((entry) {
                return DataRow(cells: [
                  DataCell(Text(entry.type)),
                  DataCell(Text(entry.count.toString())),
                  DataCell(Text(entry.pinned.toString())),
                ]);
              }).toList(),
            )
          : const Padding(
              padding: EdgeInsets.all(64.0),
              child: Center(child: Text('Nothing to show here!')),
            ),
    );
  }
}
