import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/src/app/const/measures.dart';
import 'package:token_swarm/src/app/const/typography.dart';
import 'package:token_swarm/src/features/home_screen/provider/token_provider.dart';
import 'package:token_swarm/src/features/home_screen/widgets/dialogs/edit_tapped_dialog.dart';

class TappedSelector extends ConsumerWidget {
  const TappedSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tappedNumber = ref.watch(tokenProvider)?.tappedNumber;
    return Column(
      children: [
        const IntrinsicHeight(
          child: Text('Tapped'),
        ),
        IntrinsicHeight(
          child: Row(
            children: [
              IntrinsicWidth(
                child: IconButton(
                  icon: const Icon(Icons.remove),
                  padding: const EdgeInsets.symmetric(
                    vertical: SelectedTokenConstants.buttonSizeVertical,
                    horizontal: SelectedTokenConstants.buttonSizeHorizontal,
                  ),
                  iconSize: SelectedTokenConstants.iconSize,
                  color: Theme.of(context).primaryColor,
                  onPressed: () =>
                      ref.read(tokenProvider.notifier).decreaseTapped(1),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) => const EditTappedNumberDialog(),
                  ),
                  child: Text(
                    '$tappedNumber',
                    textAlign: TextAlign.center,
                    style: MyTypography.h3Bold,
                  ),
                ),
              ),
              IntrinsicWidth(
                child: IconButton(
                  icon: const Icon(Icons.add),
                  padding: const EdgeInsets.symmetric(
                    vertical: SelectedTokenConstants.buttonSizeVertical,
                    horizontal: SelectedTokenConstants.buttonSizeHorizontal,
                  ),
                  iconSize: SelectedTokenConstants.iconSize,
                  color: Theme.of(context).primaryColor,
                  onPressed: () =>
                      ref.read(tokenProvider.notifier).increaseTapped(1),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
