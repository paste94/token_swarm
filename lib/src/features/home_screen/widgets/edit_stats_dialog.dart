import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:token_swarm/src/app/const/measures.dart';
import 'package:token_swarm/src/app/const/typography.dart';
import 'package:token_swarm/src/features/home_screen/provider/token_provider.dart';

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
      child: Padding(
        padding: const EdgeInsets.all(TRIPLE_PADDING),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Select stats',
                  style: HEADLINE,
                ),
              ],
            ),
            const Divider(
              height: DOUBLE_PADDING,
              color: Colors.transparent,
            ),
            // Content
            const Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text('Power', style: SUPPORTING_TEXT),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text('Toughness', style: SUPPORTING_TEXT),
                  ),
                ),
              ],
            ),
            const Divider(
              height: PADDING,
              color: Colors.transparent,
            ),
            Row(
              children: [
                Expanded(
                  child: NumberPicker(
                    minValue: 0,
                    maxValue: 99,
                    value: _power,
                    onChanged: (value) => setState(() => _power = value),
                  ),
                ),
                Expanded(
                  child: NumberPicker(
                    minValue: 0,
                    maxValue: 99,
                    value: _toughness,
                    onChanged: (value) => setState(() => _toughness = value),
                  ),
                ),
              ],
            ),
            const Divider(
              height: TRIPLE_PADDING,
              color: Colors.transparent,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => context.pop(),
                  child: const Text('Cancel'),
                ),
                const VerticalDivider(
                  width: PADDING,
                  color: Colors.transparent,
                ),
                TextButton(
                  onPressed: () {
                    ref.read(tokenProvider.notifier).setPower(_power);
                    ref.read(tokenProvider.notifier).setToughness(_toughness);
                    context.pop();
                  },
                  child: const Text('Accept'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
