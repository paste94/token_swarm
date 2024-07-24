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
        padding:
            const EdgeInsets.only(left: DOUBLE_PADDING, right: DOUBLE_PADDING),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // HEADER
              IntrinsicHeight(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(MATERIAL_RADIUS),
                      topRight: Radius.circular(MATERIAL_RADIUS),
                    ),
                    color: color,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: DOUBLE_PADDING,
                          bottom: PADDING,
                        ),
                        child: Icon(
                          icon,
                          size: ALERT_ICON_SIZE,
                          color: iconColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: DOUBLE_PADDING),
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
              // BODY
              ListTile(
                title: Text(title),
                subtitle: Text(text),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
