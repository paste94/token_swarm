import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:token_swarm/l10n/generated/app_localizations.dart';
import 'package:token_swarm/src/app/db/model/token_card_db.dart';
import 'package:token_swarm/src/app/db/provider/token_card_db_list_provider.dart';
import 'package:token_swarm/src/features/S000_token_list/widgets/token_tile/token_tile.dart';

class TokenCarousel extends ConsumerStatefulWidget {
  const TokenCarousel({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TokenCarouselState();
}

class _TokenCarouselState extends ConsumerState<TokenCarousel> {
  int _currentIndex = 0;
  CarouselSliderController carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final list = ref.watch(tokenCardDbListProvider);
    final log = Logger('TokenCarousel');

    onData(List<TokenCardDb>? data) => data!.isEmpty
        ? Center(child: Text(Loc.of(context).pressBtnToAdd))
        : Column(
            children: [
              CarouselSlider(
                items: data.map((token) => TokenTile(token)).toList(),
                carouselController: carouselController,
                options: CarouselOptions(
                    enableInfiniteScroll: false,
                    aspectRatio: 0.7,
                    enlargeFactor: 0.2,
                    enlargeCenterPage: true,
                    viewportFraction: 0.85,
                    onPageChanged: (index, reason) {
                      setState(() => _currentIndex = index);
                    }),
              ),
              const Expanded(child: SizedBox()),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Slider(
                  value: _currentIndex.toDouble(),
                  onChanged: (value) async {
                    await carouselController.animateToPage(value.toInt());
                    setState(() => _currentIndex = value.toInt());
                  },
                  divisions: data.length - 1,
                  max: data.length.toDouble() - 1,
                ),
              ),
            ],
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
