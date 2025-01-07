import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/src/app/db/model/token_card_db.dart';
import 'package:token_swarm/src/app/db/provider/token_card_db_list_provider.dart';

class BtnDeleteToken extends ConsumerWidget {
  const BtnDeleteToken({super.key, required this.token});

  final TokenCardDb token;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    handleDelete() {
      showDialog(
        context: context,
        builder: (BuildContext ctx) => AlertDialog(
          title: const Text('Confirm'),
          content: const Text('Confirm?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                ref.read(tokenCardDbListProvider.notifier).deleteCard(token);
                Navigator.of(context).pop();
              },
              child: const Text('Yes'),
            ),
          ],
        ),
      );
    }

    return IconButton(
      onPressed: handleDelete,
      icon: const Icon(Icons.delete),
    );
  }
}
