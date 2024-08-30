import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:token_swarm/src/app/const/asset_paths.dart';
import 'package:token_swarm/src/app/const/heroes.dart';
import 'package:token_swarm/src/app/const/measures.dart';
import 'package:token_swarm/src/app/const/typography.dart';
import 'package:token_swarm/src/features/home_screen/provider/token_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditStatsDialog extends ConsumerStatefulWidget {
  const EditStatsDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditStatsDialogState();
}

class _EditStatsDialogState extends ConsumerState<EditStatsDialog> {
  late int _power;
  late int _toughness;

  @override
  void initState() {
    super.initState();
    _power = ref.read(tokenProvider)!.power!;
    _toughness = ref.read(tokenProvider)!.toughness!;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Hero(
        tag: HeroesStringTokens.powerToughnessDialog,
        child: Padding(
          padding: const EdgeInsets.all(ConstPadding.triplePadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)?.seelctStats ?? 'xxx',
                    style: MyTypography.dialogTitle,
                  ),
                ],
              ),
              const Divider(
                height: ConstPadding.doublePadding,
                color: Colors.transparent,
              ),
              // Content
              Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        AssetsPaths.powerIcon,
                        height: DialogIcons.statsDialogIconHeight,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).iconTheme.color!,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        AssetsPaths.toughnessIcon,
                        height: DialogIcons.statsDialogIconHeight,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).iconTheme.color!,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(
                height: ConstPadding.padding,
                color: Colors.transparent,
              ),
              Row(
                children: [
                  Expanded(
                    child: NumberPicker(
                      minValue: DialogIcons.statsDialogMin,
                      maxValue: DialogIcons.statsDialogMax,
                      value: _power,
                      onChanged: (value) => setState(() => _power = value),
                    ),
                  ),
                  Expanded(
                    child: NumberPicker(
                      minValue: DialogIcons.statsDialogMin,
                      maxValue: DialogIcons.statsDialogMax,
                      value: _toughness,
                      onChanged: (value) => setState(() => _toughness = value),
                    ),
                  ),
                ],
              ),
              const Divider(
                height: ConstPadding.triplePadding,
                color: Colors.transparent,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => context.pop(),
                    child: Text(AppLocalizations.of(context)?.cancel ?? 'xxx'),
                  ),
                  const VerticalDivider(
                    width: ConstPadding.padding,
                    color: Colors.transparent,
                  ),
                  TextButton(
                    onPressed: () {
                      ref.read(tokenProvider.notifier).setPower(_power);
                      ref.read(tokenProvider.notifier).setToughness(_toughness);
                      context.pop();
                    },
                    child: Text(AppLocalizations.of(context)?.confirm ?? 'xxx'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
