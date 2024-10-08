import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/src/app/provider/token_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeleteButton extends ConsumerWidget {
  const DeleteButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isTokenSelected = ref.watch(tokenProvider) != null;
    var loc = AppLocalizations.of(context);
    String dialogTitle = loc?.deleteTokenQuestion ?? 'xxx';
    String dialogDetails = loc?.deleteTokenQuestionDetails ?? 'xxx';
    String dialogCancelBtnTxt = loc?.cancel ?? 'xxx';
    String dialogDeleteBtnTxt = loc?.delete ?? 'xxx';

    return IconButton(
      onPressed: isTokenSelected
          ? () => showDialog(
                context: context,
                builder: (builder) => AlertDialog(
                  title: Text(dialogTitle),
                  content: Text(dialogDetails),
                  actions: [
                    TextButton(
                      child: Text(dialogCancelBtnTxt),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    TextButton(
                      child: Text(dialogDeleteBtnTxt),
                      onPressed: () => ref
                          .read(tokenProvider.notifier)
                          .removeToken()
                          .then((value) => Navigator.of(context).pop()),
                    ),
                  ],
                ),
              )
          : null,
      icon: const Icon(Icons.delete),
    );
  }
}
