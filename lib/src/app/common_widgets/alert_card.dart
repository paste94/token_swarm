import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/src/app/const/measures.dart';

class AlertCard extends ConsumerWidget {
  const AlertCard({
    super.key,
    required this.iconText,
    required this.title,
    required this.text,
    this.color,
    this.iconColor,
    this.icon,
  });

  final String iconText;
  final String title;
  final String text;
  final Color? color;
  final Color? iconColor;
  final IconData? icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
          left: ConstPadding.doublePadding,
          right: ConstPadding.doublePadding,
        ),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // HEADER
              Flexible(
                flex: 2,
                child: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(
                          SearchCardConstants.cardBorderRadius,
                        ),
                        topRight: Radius.circular(
                          SearchCardConstants.cardBorderRadius,
                        ),
                      ),
                      color: color,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: ConstPadding.doublePadding,
                            bottom: ConstPadding.padding,
                          ),
                          child: Icon(
                            icon,
                            size: ALERT_ICON_SIZE,
                            color: iconColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: ConstPadding.doublePadding),
                          child: Text(
                            iconText,
                            style: TextStyle(
                              color: iconColor,
                              fontSize: ALERT_FONT_SIZE,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              // BODY
              Flexible(
                flex: 1,
                child: ListTile(
                  title: Text(title),
                  subtitle: Text(text),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
