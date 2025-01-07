import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:token_swarm/l10n/generated/app_localizations.dart';
import 'package:token_swarm/src/app/const/measures.dart';
import 'package:token_swarm/src/app/const/typography.dart';
import 'package:token_swarm/src/app/provider/token_provider.dart';

class EditTappedNumberDialog extends ConsumerStatefulWidget {
  const EditTappedNumberDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditTappedNumberDialogState();
}

class _EditTappedNumberDialogState
    extends ConsumerState<EditTappedNumberDialog> {
  late TextEditingController _numberController;
  String? _error;

  @override
  void initState() {
    super.initState();
    _numberController = TextEditingController()
      ..text = '${ref.read(tokenProvider)?.tappedNumber}';
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(ConstPadding.triplePadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title
            Row(
              children: [
                Text(
                  Loc.of(context).howManyTappedQuestion,
                  style: MyTypography.dialogTitle,
                ),
              ],
            ),
            const Divider(
              height: ConstPadding.doublePadding,
              color: Colors.transparent,
            ),

            // Content
            TextField(
              controller: _numberController,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              keyboardType: TextInputType.number,
              style: MyTypography.h3Bold,
              decoration: InputDecoration(errorText: _error),
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
                  child: Text(
                    Loc.of(context).cancel,
                  ),
                ),
                const VerticalDivider(
                  width: ConstPadding.padding,
                  color: Colors.transparent,
                ),
                TextButton(
                  onPressed: () {
                    if (_numberController.text == '') {
                      setState(
                        () => _error = Loc.of(context).valueCannotBeEmpty,
                      );
                    }
                    // int newVal = int.parse(_numberController.text);
                    // ref.read(tokenProvider.notifier).setTappedNumber(newVal);
                    context.pop();
                  },
                  child: Text(Loc.of(context).confirm),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
