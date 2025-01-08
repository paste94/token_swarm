import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:token_swarm/l10n/generated/app_localizations.dart';
import 'package:token_swarm/src/app/const/asset_paths.dart';
import 'package:token_swarm/src/app/const/heroes.dart';
import 'package:token_swarm/src/app/const/measures.dart';
import 'package:token_swarm/src/app/const/typography.dart';
import 'package:token_swarm/src/app/db/model/token_card_db.dart';
import 'package:token_swarm/src/app/db/provider/token_card_db_list_provider.dart';

class EditStatsDialog extends ConsumerStatefulWidget {
  const EditStatsDialog({super.key, required this.token});

  final TokenCardDb token;

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
    _power = widget.token.power!;
    _toughness = widget.token.toughness!;
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
              /// Title
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Loc.of(context).seelctStats,
                    style: MyTypography.dialogTitle,
                  ),
                ],
              ),

              /// Divider
              const Divider(
                height: ConstPadding.doublePadding,
                color: Colors.transparent,
              ),

              /// Content
              Row(
                children: [
                  /// Power icon
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

                  /// Toughness icon
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

              /// Divider
              const Divider(
                height: ConstPadding.padding,
                color: Colors.transparent,
              ),

              /// Number pickers
              Row(
                children: [
                  /// Power picker
                  Expanded(
                    child: NumberPicker(
                      minValue: DialogIcons.statsDialogMin,
                      maxValue: DialogIcons.statsDialogMax,
                      value: _power,
                      onChanged: (value) => setState(() => _power = value),
                    ),
                  ),

                  /// Toughness picker
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

              /// Divider
              const Divider(
                height: ConstPadding.triplePadding,
                color: Colors.transparent,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  /// Cancel button
                  TextButton(
                    onPressed: () => context.pop(),
                    child: Text(Loc.of(context).cancel),
                  ),

                  /// Divider
                  const VerticalDivider(
                    width: ConstPadding.padding,
                    color: Colors.transparent,
                  ),

                  /// Confirm button
                  TextButton(
                    onPressed: () {
                      ref
                          .read(tokenCardDbListProvider.notifier)
                          .updatePower(token: widget.token, number: _power);
                      ref
                          .read(tokenCardDbListProvider.notifier)
                          .updateToughness(
                              token: widget.token, number: _toughness);
                      context.pop();
                    },
                    child: Text(Loc.of(context).confirm),
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
