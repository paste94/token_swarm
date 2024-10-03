import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:token_swarm/src/app/const/asset_paths.dart';
import 'package:token_swarm/src/features/home_screen/provider/token_provider.dart';

class TapActions extends ConsumerWidget {
  const TapActions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: IconButton(
            onPressed: () => ref.read(tokenProvider.notifier).tap(),
            icon: SvgPicture.asset(
              AssetsPaths.tapIcon,
              height: 19,
              colorFilter: ColorFilter.mode(
                Theme.of(context).iconTheme.color!,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        Expanded(
          child: IconButton(
            onPressed: () => ref.read(tokenProvider.notifier).untap(),
            icon: SvgPicture.asset(
              AssetsPaths.untapIcon,
              height: 19,
              colorFilter: ColorFilter.mode(
                Theme.of(context).iconTheme.color!,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
