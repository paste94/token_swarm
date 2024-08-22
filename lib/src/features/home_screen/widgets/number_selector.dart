import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/src/app/const/measures.dart';
import 'package:token_swarm/src/features/home_screen/provider/token_provider.dart';
import 'package:token_swarm/src/features/home_screen/widgets/dialogs/edit_number_dialog.dart';

class NumberSelector extends ConsumerWidget {
  const NumberSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var tokenNumber = ref.watch(tokenProvider)?.tokenNumber;
    return Column(
      children: [
        const IntrinsicHeight(
          child: Text('Tot'),
        ),
        IntrinsicHeight(
          child: Row(
            children: [
              IntrinsicWidth(
                child: IconButton(
                  icon: const Icon(Icons.remove),
                  padding: const EdgeInsets.symmetric(
                    vertical: 4.0,
                    horizontal: 18.0,
                  ),
                  iconSize: ICON_SIZE_S,
                  color: Theme.of(context).primaryColor,
                  onPressed: () =>
                      ref.read(tokenProvider.notifier).decreaseNumber(1),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => showDialog(
                      context: context,
                      builder: (context) {
                        return EditTokenNumberDialog();
                      }),
                  child: Text(
                    '$tokenNumber',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              IntrinsicWidth(
                child: Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.add),
                      padding: const EdgeInsets.symmetric(
                        vertical: 4.0,
                        horizontal: 18.0,
                      ),
                      iconSize: ICON_SIZE_S,
                      color: Theme.of(context).primaryColor,
                      onPressed: () =>
                          ref.read(tokenProvider.notifier).increaseNumber(1),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
