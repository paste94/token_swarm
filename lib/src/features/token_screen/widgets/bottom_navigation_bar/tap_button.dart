import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:token_swarm/l10n/generated/app_localizations.dart';
import 'package:token_swarm/src/app/common_widgets/dialogs/edit_tapped_dialog.dart';
import 'package:token_swarm/src/app/const/asset_paths.dart';
import 'package:token_swarm/src/app/const/measures.dart';
import 'package:token_swarm/src/app/const/typography.dart';
import 'package:token_swarm/src/app/provider/token_provider.dart';

class TapButton extends ConsumerWidget {
  const TapButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isTokenSelected = ref.watch(tokenProvider) != null;
    int? tappedNumber = ref.watch(tokenProvider)?.tappedNumber;

    void pop() => Navigator.of(context).pop();

    return IconButton(
      onPressed: isTokenSelected
          ? () => showDialog(
                context: context,
                builder: (builder) => AlertDialog(
                  title: Text(Loc.of(context).seelctStats),
                  content: Row(
                    children: [
                      IntrinsicWidth(
                        child: IconButton(
                            icon: const Icon(Icons.remove),
                            padding: const EdgeInsets.symmetric(
                              vertical:
                                  SelectedTokenConstants.buttonSizeVertical,
                              horizontal:
                                  SelectedTokenConstants.buttonSizeHorizontal,
                            ),
                            iconSize: SelectedTokenConstants.iconSize,
                            color: Theme.of(context).primaryColor,
                            onPressed: () => ref.read(tokenProvider.notifier)
                            // .decreaseTapped(1),
                            ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => showDialog(
                            context: context,
                            builder: (context) =>
                                const EditTappedNumberDialog(),
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
                              vertical:
                                  SelectedTokenConstants.buttonSizeVertical,
                              horizontal:
                                  SelectedTokenConstants.buttonSizeHorizontal,
                            ),
                            iconSize: SelectedTokenConstants.iconSize,
                            color: Theme.of(context).primaryColor,
                            onPressed: () => ref.read(tokenProvider.notifier)
                            // .increaseTapped(1),
                            ),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: pop,
                      child: Text(Loc.of(context).cancel),
                    ),
                    TextButton(
                      child: Text(Loc.of(context).confirm),
                      onPressed: () => ref
                          .read(tokenProvider.notifier)
                          .removeToken()
                          .then((value) => pop()),
                    ),
                  ],
                ),
              )
          : null,
      icon: SvgPicture.asset(
        AssetsPaths.tapIcon,
        height: 19,
        colorFilter: ColorFilter.mode(
          Theme.of(context).iconTheme.color!,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
