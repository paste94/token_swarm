import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:token_swarm/src/app/const/asset_paths.dart';
import 'package:token_swarm/src/app/const/measures.dart';
import 'package:token_swarm/src/app/const/typography.dart';
import 'package:token_swarm/src/features/home_screen/home_widgets.dart';
import 'package:token_swarm/src/app/provider/token_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TapButton extends ConsumerWidget {
  const TapButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isTokenSelected = ref.watch(tokenProvider) != null;
    final tappedNumber = ref.watch(tokenProvider)?.tappedNumber;

    var loc = AppLocalizations.of(context);
    String dialogCancelBtnTxt = loc?.cancel ?? 'xxx';
    String dialogConfirmBtnTxt = loc?.confirm ?? 'xxx';
    String dialogTitle = loc?.seelctStats ?? 'xxx';

    return IconButton(
      onPressed: isTokenSelected
          ? () => showDialog(
                context: context,
                builder: (builder) => AlertDialog(
                  title: Text(dialogTitle),
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
                      child: Text(dialogCancelBtnTxt),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    TextButton(
                      child: Text(dialogConfirmBtnTxt),
                      onPressed: () => ref
                          .read(tokenProvider.notifier)
                          .removeToken()
                          .then((value) => Navigator.of(context).pop()),
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
