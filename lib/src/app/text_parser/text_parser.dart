import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

RichText parseTokenText(BuildContext context, String text) {
  List<InlineSpan>? newText = [];
  final regex = RegExp(r'\{(.*?)\}');

  int lastMatchEnd = 0;
  for (final match in regex.allMatches(text)) {
    print(match.end);

    /// Aggiunge il testo precedente alla parentesi graffa
    if (match.start > lastMatchEnd) {
      newText.add(TextSpan(text: text.substring(lastMatchEnd, match.start)));
    }

    /// Recupera il contenuto delle parentesi graffe
    final iconName = match.group(1);
    if (iconName != null) {
      newText.add(
        WidgetSpan(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 2, right: 2),
            child: SvgPicture.asset(
              'assets/icons/Mana/$iconName.svg',
              height: Theme.of(context).textTheme.bodyLarge!.fontSize,
            ),
          ),
        ),
      );

      lastMatchEnd = match.end;
    }
  }

  /// Aggiunge il testo rimanente dopo l'ultima parentesi graffa
  if (lastMatchEnd < text.length) {
    newText.add(TextSpan(text: text.substring(lastMatchEnd)));
  }

  return RichText(
    text: TextSpan(
      style: Theme.of(context).textTheme.bodyLarge,
      children: newText,
    ),
  );
}
