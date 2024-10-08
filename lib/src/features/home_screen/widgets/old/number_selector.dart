import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/src/app/const/measures.dart';
import 'package:token_swarm/src/app/const/typography.dart';
import 'package:token_swarm/src/app/provider/token_provider.dart';
import 'package:token_swarm/src/features/home_screen/widgets/dialogs/edit_number_dialog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NumberSelector extends ConsumerWidget {
  const NumberSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var tokenNumber = ref.watch(tokenProvider)?.tokenNumber;
    return Column(
      children: [
        IntrinsicHeight(
          child: Text(AppLocalizations.of(context)?.total ?? 'xxx'),
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
                    onPressed: () => {}
                    // ref.read(tokenProvider.notifier).decreaseNumber(1),
                    ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => showDialog(
                      context: context,
                      builder: (context) {
                        return const EditTokenNumberDialog();
                      }),
                  child: Text(
                    '$tokenNumber',
                    textAlign: TextAlign.center,
                    style: MyTypography.h3Bold,
                  ),
                ),
              ),
              IntrinsicWidth(
                child: Column(
                  children: [
                    IconButton(
                        icon: const Icon(Icons.add),
                        padding: const EdgeInsets.symmetric(
                          vertical: SelectedTokenConstants.buttonSizeVertical,
                          horizontal:
                              SelectedTokenConstants.buttonSizeHorizontal,
                        ),
                        iconSize: SelectedTokenConstants.iconSize,
                        color: Theme.of(context).primaryColor,
                        onPressed: () => {}
                        // ref.read(tokenProvider.notifier).increaseNumber(1),
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
