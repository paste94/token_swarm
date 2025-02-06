import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scryfall_api/scryfall_api.dart' as scryfall_api;

class SummaryItem extends ConsumerWidget {
  const SummaryItem({super.key, this.image, this.number, this.color});

  final Widget? image;
  final int? number;
  final scryfall_api.Color? color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return (image != null && number != null)
        ? Stack(
            alignment: Alignment.center,
            children: [
              image!,
              Positioned(
                left: 0,
                right: 0,
                bottom: -6, // Distanza dal fondo
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      number!.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        : Container();
  }
}
