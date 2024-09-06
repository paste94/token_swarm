import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/src/app/const/asset_paths.dart';
import 'package:token_swarm/src/app/model/token_preview.dart';
import 'package:token_swarm/src/app/persistence/provider/persistence.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:token_swarm/src/features/home_screen/provider/token_provider.dart';

class HistoryList extends ConsumerStatefulWidget {
  const HistoryList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HistoryListState();
}

class _HistoryListState extends ConsumerState<HistoryList> {
  bool _isItemEnabled = true;
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

  onSuccess(_) => setState(() => _isItemEnabled = true);

  onError(error, _) {
    if (error is SocketException) {
      ScaffoldMessenger.of(context).showSnackBar(
          _snackBar(AppLocalizations.of(context)?.noInternetDetails ?? 'xxx'));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(_snackBar(error.toString()));
    }
    setState(() => _isItemEnabled = true);
  }

  Widget _buildRow(TokenPreview token) {
    return InkWell(
      onTap: () {
        setState(() => _isItemEnabled = false);
        ref
            .read(tokenProvider.notifier)
            .setTokenFromId(token.id)
            .then(onSuccess)
            .onError(onError);
      },
      onTapDown: (details) =>
          setState(() => _tapPosition = details.globalPosition),
      onLongPress: () => showMenu(
        context: context,
        position: _getPosition(),
        items: [
          PopupMenuItem(
            value: 'delete',
            child: Text(AppLocalizations.of(context)?.delete ?? 'xxx'),
            onTap: () =>
                ref.read(persistenceProvider.notifier).delete(token.id),
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
  }

  @override
  Widget build(BuildContext context) {
    final d = ref.watch(persistenceProvider);
    return Column(
      children: [
        Text(AppLocalizations.of(context)?.lastUsed ?? 'xxx'),
        Expanded(
          child: ListView.separated(
            itemCount: d.length,
            itemBuilder: (BuildContext context, int i) => _buildRow(d[i]),
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(height: 0),
          ),
        ),
      ],
    );
  }
}
