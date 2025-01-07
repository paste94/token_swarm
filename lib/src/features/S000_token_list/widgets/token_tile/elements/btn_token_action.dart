import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:token_swarm/src/app/const/asset_paths.dart';

class BtnTokenAction extends ConsumerWidget {
  const BtnTokenAction({
    super.key,
    required this.onTap,
    required this.label,
    required this.iconPath,
  });

  final Function() onTap;
  final String label;
  final String iconPath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton.filledTonal(
      onPressed: onTap,
      // label: Text(label),
      icon: Padding(
        padding: const EdgeInsets.all(8),
        child: SvgPicture.asset(
          iconPath,
          height: 25,
          colorFilter: ColorFilter.mode(
            Theme.of(context).iconTheme.color!,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
