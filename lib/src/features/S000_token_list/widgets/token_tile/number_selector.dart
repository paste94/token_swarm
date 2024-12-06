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
    return IntrinsicWidth(
      child: Card.outlined(
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                flex: 2,
                child: Tooltip(
                  message: title,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: icon,
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: IconButton.filledTonal(
                  onPressed: handleRemove,
                  icon: const Icon(Icons.remove),
                ),
              ),
              const SizedBox(width: 16),
              Flexible(
                flex: 2,
                child: Text(
                  '$numberToShow',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              const SizedBox(width: 16),
              Flexible(
                flex: 2,
                child: IconButton.filledTonal(
                  onPressed: handleAdd,
                  icon: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
