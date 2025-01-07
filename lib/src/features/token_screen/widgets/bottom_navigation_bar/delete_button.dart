import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/l10n/generated/app_localizations.dart';
import 'package:token_swarm/src/app/provider/token_provider.dart';

class DeleteButton extends ConsumerWidget {
  const DeleteButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isTokenSelected = ref.watch(tokenProvider) != null;
    pop() => Navigator.of(context).pop();

    return IconButton(
      onPressed: isTokenSelected
          ? () => showDialog(
                context: context,
                builder: (builder) => AlertDialog(
                  title: Text(Loc.of(context).deleteTokenQuestion),
                  content: Text(Loc.of(context).deleteTokenQuestionDetails),
                  actions: [
                    TextButton(
                      onPressed: pop,
                      child: Text(Loc.of(context).cancel),
                    ),
                    TextButton(
                      child: Text(Loc.of(context).delete),
                      onPressed: () {
                        ref
                            .read(tokenProvider.notifier)
                            .removeToken()
                            .then((_) => pop());
                      },
                    ),
                  ],
                ),
              )
          : null,
      icon: const Icon(Icons.delete),
    );
  }
}
