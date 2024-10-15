import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:token_swarm/src/app/provider/settings_provider.dart';
import 'package:token_swarm/src/app/routes/routes.dart';

class SettingsMenuButtons extends ConsumerWidget {
  const SettingsMenuButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAlwaysOnActive = ref.watch(alwaysOnDisplayProvider);

    Widget checkBox() => isAlwaysOnActive.when(
          data: (value) => value
              ? Icon(
                  Icons.check_box,
                  color: Theme.of(context).colorScheme.primary,
                )
              : const Icon(Icons.check_box_outline_blank),
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => const CircularProgressIndicator(),
        );

    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 0,
          child: Text(AppLocalizations.of(context)?.about ?? 'xxx'),
        ),
        PopupMenuItem(
          value: 1,
          child: InkWell(
            child: Row(
              children: [
                Text(AppLocalizations.of(context)?.alwaysOnDisplay ?? 'xxx'),
                const Expanded(child: Divider(color: Colors.transparent)),
                checkBox(),
              ],
            ),
          ),
        )
      ],
      onSelected: (value) {
        switch (value) {
          case 0:
            context.push(RoutePath.about);
          case 1:
            ref.read(alwaysOnDisplayProvider.notifier).toggle();
        }
      },
    );
  }
}
