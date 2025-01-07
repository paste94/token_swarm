import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:token_swarm/l10n/generated/app_localizations.dart';
import 'package:token_swarm/src/app/const/asset_paths.dart';
import 'package:token_swarm/src/app/model/token_preview.dart';
import 'package:token_swarm/src/app/persistence/provider/persistence.dart';
import 'package:token_swarm/src/app/provider/token_provider.dart';
import 'package:token_swarm/src/app/routes/routes.dart';

class HistoryView extends ConsumerStatefulWidget {
  const HistoryView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HistoryViewState();
}

class _HistoryViewState extends ConsumerState<HistoryView> {
  /// Disables tiles in case of click on it
  bool _isItemEnabled = true;

  /// Gets position for the ling press
  Offset _tapPosition = Offset.zero;

  RelativeRect _getPosition() => RelativeRect.fromLTRB(
        _tapPosition.dx,
        _tapPosition.dy,
        MediaQuery.of(context).size.width - _tapPosition.dx,
        MediaQuery.of(context).size.height - _tapPosition.dy,
      );

  SnackBar _snackBar(String message) => SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: 'Close',
          onPressed: () {},
        ),
      );

  Widget _buildRow(context, TokenPreview token) => InkWell(
        onTap: () {
          setState(() => _isItemEnabled = false);
          ref.read(tokenProvider.notifier).setTokenFromId(token.id).then(
            (_) {
              setState(() => _isItemEnabled = true);
              context.push(RoutePath.token);
            },
          ).onError(
            (error, _) {
              if (error is SocketException) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(_snackBar(Loc.of(context).noInternetDetails));
              } else {
                ScaffoldMessenger.of(context)
                    .showSnackBar(_snackBar(error.toString()));
              }
              setState(() => _isItemEnabled = true);
            },
          );
        },
        onTapDown: (details) =>
            setState(() => _tapPosition = details.globalPosition),
        onLongPress: () => showMenu(
          context: context,
          position: _getPosition(),
          items: [
            PopupMenuItem(
              value: 'delete',
              child: Text(Loc.of(context).delete),
              onTap: () =>
                  ref.read(historyListProvider.notifier).delete(token.id),
            ),
          ],
        ),
        child: ListTile(
          enabled: _isItemEnabled,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CachedNetworkImage(
              imageUrl: token.imageUri!,
              progressIndicatorBuilder: (_, __, ___) => const Image(
                image: AssetImage(AssetsPaths.mtgRear),
              ),
              errorWidget: (_, __, ___) => const SizedBox(
                child: Icon(Icons.image_not_supported),
              ),
            ),
          ),
          title: Text(token.name),
          visualDensity: const VisualDensity(vertical: 4),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final asyncHistory = ref.watch(historyListProvider);

    return asyncHistory.when(
      data: (data) => data.isNotEmpty
          ? Column(
              children: [
                Text(Loc.of(context).lastUsed),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, i) => _buildRow(context, data[i]),
                    separatorBuilder: (context, i) => const Divider(height: 0),
                    itemCount: data.length,
                  ),
                )
              ],
            )
          : Center(child: Text(Loc.of(context).pressBtnToAdd)),
      error: (data, error) => Center(child: Text(error.toString())),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
