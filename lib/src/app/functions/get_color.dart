import 'package:flutter/material.dart';
import 'package:scryfall_api/scryfall_api.dart' as scryfall_api;

Color getColor(BuildContext context, scryfall_api.Color? color) {
  if (color == null) {
    return Colors.white;
  }
  switch (color) {
    case scryfall_api.Color.white:
      return const Color(0xfff8f7da);
    case scryfall_api.Color.blue:
      return const Color(0xffbbd9eb);
    case scryfall_api.Color.black:
      return const Color(0xffb9b0aa);
    case scryfall_api.Color.red:
      return const Color(0xffe59977);
    case scryfall_api.Color.green:
      return const Color(0xffa2bf95);
    default:
      return Colors.white;
  }
}

Color getSecondaryColor(BuildContext context, scryfall_api.Color? color) {
  if (color == null) {
    return const Color.fromARGB(255, 121, 121, 121);
  }
  switch (color) {
    case scryfall_api.Color.white:
      return Colors.yellow;
    case scryfall_api.Color.blue:
      return Colors.blue;
    case scryfall_api.Color.black:
      return Colors.black;
    case scryfall_api.Color.red:
      return Colors.red;
    case scryfall_api.Color.green:
      return Colors.green;
    default:
      return const Color.fromARGB(255, 121, 121, 121);
  }
}

List<Color> getColors(BuildContext context, List<scryfall_api.Color> colors) {
  if (colors.isEmpty || colors.length == 1) {
    return [
      getColor(context, colors.firstOrNull),
      getSecondaryColor(context, colors.firstOrNull),
      getColor(context, colors.firstOrNull),
      getSecondaryColor(context, colors.firstOrNull),
      getColor(context, colors.firstOrNull),
      getSecondaryColor(context, colors.firstOrNull),
      getColor(context, colors.firstOrNull),
      getSecondaryColor(context, colors.firstOrNull),
      getColor(context, colors.firstOrNull),
      getSecondaryColor(context, colors.firstOrNull),
      getColor(context, colors.firstOrNull),
      getSecondaryColor(context, colors.firstOrNull),
      getColor(context, colors.firstOrNull),
    ];
  }

  return colors.map((e) => getSecondaryColor(context, e)).toList()
    ..addAll(colors.map((e) => getSecondaryColor(context, e)).toList());
}
