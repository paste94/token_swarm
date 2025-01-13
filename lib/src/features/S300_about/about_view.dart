import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:token_swarm/l10n/generated/app_localizations.dart';
import 'package:token_swarm/src/app/const/asset_paths.dart';
import 'package:token_swarm/src/app/const/typography.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Loc.of(context).about)),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const Divider(color: Colors.transparent),
          Center(
            child: SvgPicture.asset(
              AssetsPaths.appIcon,
              height: 200,
              colorFilter: ColorFilter.mode(
                Theme.of(context).iconTheme.color!,
                BlendMode.srcIn,
              ),
            ),
          ),
          const Divider(color: Colors.transparent),
          Center(
              child: Text(
            'Token Swarm',
            style: Theme.of(context).textTheme.headlineMedium,
          )),
          Center(
              child: Text(
            'v 0.0.1',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontStyle: FontStyle.italic,
                  color: Colors.black54,
                ),
          )),
        ],
      )),
    );
  }
}
