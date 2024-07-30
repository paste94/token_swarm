import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:token_swarm/src/app/const/measures.dart';
import 'package:token_swarm/src/app/const/typography.dart';
import 'package:token_swarm/src/features/home_screen/provider/token_provider.dart';

class EditTokenNumberDialog extends ConsumerStatefulWidget {
  const EditTokenNumberDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditTokenNumberDialogState();
}

class _EditTokenNumberDialogState extends ConsumerState<EditTokenNumberDialog> {
  late TextEditingController _numberController;
  String? _error;

  @override
  void initState() {
    super.initState();
    _numberController = TextEditingController()
      ..text = '${ref.read(tokenProvider)?.tokenNumber}';
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
                  'Select Number',
                  style: HEADLINE,
                ),
              ],
            ),
            const Divider(
              height: DOUBLE_PADDING,
              color: Colors.transparent,
            ),

            // Content
            TextField(
              controller: _numberController,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(errorText: _error),
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
                    if (_numberController.text == '') {
                      setState(() => _error = 'Value cannot be empty');
                    }
                    int newVal = int.parse(_numberController.text);
                    ref.read(tokenProvider.notifier).setTokenNumber(newVal);
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
