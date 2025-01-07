import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NumberSelector extends ConsumerWidget {
  const NumberSelector({
    super.key,
    required this.title,
    required this.icon,
    required this.numberToShow,
    required this.handleRemove,
    required this.handleAdd,
  });

  final String title;
  final Widget icon;
  final int numberToShow;
  final void Function()? handleRemove;
  final void Function()? handleAdd;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card.outlined(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Icon
            Tooltip(
              message: title,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: icon,
              ),
            ),

            /// Remove button
            IconButton.filledTonal(
              onPressed: handleRemove,
              icon: const Icon(Icons.remove),
            ),

            /// Number
            Expanded(
              child: Text(
                '$numberToShow',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),

            /// Add button
            IconButton.filledTonal(
              onPressed: handleAdd,
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
