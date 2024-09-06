import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/src/app/persistence/provider/persistence.dart';
import 'package:token_swarm/src/features/home_screen/widgets/history_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HistoryView extends ConsumerStatefulWidget {
  const HistoryView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HistoryViewState();
}

class _HistoryViewState extends ConsumerState<HistoryView> {
  @override
  void initState() {
    ref.read(persistenceProvider.notifier).get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final historyList = ref.watch(persistenceProvider);

    return Container(
      child: historyList.isNotEmpty
          ? const HistoryList()
          : Center(
              child:
                  Text(AppLocalizations.of(context)?.pressBtnToAdd ?? 'xxx')),
    );
  }
}
