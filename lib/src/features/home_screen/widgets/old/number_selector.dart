import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/l10n/generated/app_localizations.dart';
import 'package:token_swarm/src/app/const/measures.dart';
import 'package:token_swarm/src/app/const/typography.dart';
import 'package:token_swarm/src/app/provider/token_provider.dart';

class NumberSelector extends ConsumerWidget {
  const NumberSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var tokenNumber = ref.watch(tokenProvider)?.tokenNumber;
    return Column(
      children: [
        IntrinsicHeight(
          child: Text(Loc.of(context).total),
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
                  onTap: () => {},
                  // showDialog(
                  //     context: context,
                  //     builder: (context) {
                  //       return const EditTokenNumberDialog();
                  //     }),
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
