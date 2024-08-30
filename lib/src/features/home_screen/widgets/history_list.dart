import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/src/app/model/mini_token_model.dart';
import 'package:token_swarm/src/app/persistence/provider/persistence.dart';
import 'package:token_swarm/src/features/home_screen/provider/token_provider.dart';

class HistoryList extends ConsumerStatefulWidget {
  const HistoryList({
    super.key,
    required this.data,
  });

  final List<MiniTokenModel> data;

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

  Widget _buildRow(MiniTokenModel token) {
    return InkWell(
      onTap: () async {
        setState(() => _isItemEnabled = false);
        await ref.read(tokenProvider.notifier).setTokenFromId(token.id);
        setState(() => _isItemEnabled = true);
      },
      onTapDown: (details) =>
          setState(() => _tapPosition = details.globalPosition),
      onLongPress: () => showMenu(
        context: context,
        position: _getPosition(),
        items: [
          PopupMenuItem(
            value: 'favorites',
            child: const Text('Delete'),
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
              image: AssetImage('assets/img/mtg_rear.jpg'),
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
    return Column(
      children: [
        Text('Last used'),
        Expanded(
          child: ListView.separated(
            itemCount: widget.data.length,
            itemBuilder: (BuildContext context, int i) {
              // return const Divider(height: 0);
              return _buildRow(widget.data[i]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(height: 0);
            },
          ),
        ),
      ],
    );
  }
}
