import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:token_swarm/src/app/const/asset_paths.dart';
import 'package:token_swarm/src/features/home_screen/provider/token_provider.dart';

class UntapButton extends ConsumerWidget {
  const UntapButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isTokenSelected = ref.watch(tokenProvider) != null;

    return IconButton(
      icon: SvgPicture.asset(
        AssetsPaths.untapIcon,
        height: 19,
        colorFilter: ColorFilter.mode(
          Theme.of(context).iconTheme.color!,
          BlendMode.srcIn,
        ),
      ),
      onPressed: isTokenSelected
          ? () => ref.read(tokenProvider.notifier).untapAll()
          : null,
    );
  }
}
