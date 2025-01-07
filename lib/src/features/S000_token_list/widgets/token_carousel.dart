import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/l10n/generated/app_localizations.dart';
import 'package:token_swarm/src/app/db/model/token_card_db.dart';
import 'package:token_swarm/src/app/db/provider/token_card_db_list_provider.dart';
import 'package:token_swarm/src/features/S000_token_list/widgets/token_tile/token_tile.dart';

class TokenCarousel extends ConsumerWidget {
  const TokenCarousel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(tokenCardDbListProvider);

    onData(List<TokenCardDb>? data) => data!.isEmpty
        ? Center(child: Text(Loc.of(context).pressBtnToAdd))
        : CarouselSlider(
            items: data.map((token) => TokenTile(token)).toList(),
            options: CarouselOptions(
              enableInfiniteScroll: false,
              aspectRatio: 3 / 5,
              enlargeFactor: 0.2,
              enlargeCenterPage: true,
              viewportFraction: 0.85,
            ),
          );

    return list.when(
      data: onData,
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class UncontainedLayoutCard extends StatelessWidget {
  const UncontainedLayoutCard({
    super.key,
    required this.index,
    required this.label,
  });

  final int index;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.primaries[index % Colors.primaries.length].withOpacity(0.5),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 20),
          overflow: TextOverflow.clip,
          softWrap: false,
        ),
      ),
    );
  }
}
