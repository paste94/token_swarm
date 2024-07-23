import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/src/features/search_card/provider/card_name_provider.dart';

class CardSearchBar extends ConsumerWidget {
  const CardSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SearchBar(
      // decoration: const InputDecoration(
      //   labelText: 'Search Card',
      // ),
      onChanged: (value) =>
          ref.read(searchCardNameProvider.notifier).setState(value),
    );
  }
}
