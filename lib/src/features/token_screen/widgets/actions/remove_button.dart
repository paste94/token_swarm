import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/src/app/const/measures.dart';

class RemoveButton extends ConsumerWidget {
  const RemoveButton({
    super.key,
    required this.onPressed,
  });
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(Icons.remove),
      iconSize: DialogIcons.statsDialogIconHeight,
      color: Colors.black,
    );
  }
}
