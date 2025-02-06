import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/src/features/S400_summary/widgets/summary_card_list.dart';

class Summary extends ConsumerWidget {
  const Summary({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Summary'),
      ),
      body: SummaryCardList(),
    );
  }
}
