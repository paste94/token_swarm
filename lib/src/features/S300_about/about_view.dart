import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:token_swarm/src/app/const/asset_paths.dart';
import 'package:token_swarm/src/app/const/typography.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)?.about ?? 'xxx')),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Divider(color: Colors.transparent),
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
          Divider(color: Colors.transparent),
          Center(
              child: Text(
            'Token Swarm',
            style: MyTypography.h2,
          )),
          Center(
              child: Text(
            'v 0.0.1',
            style: MyTypography.h3ItalicGrey,
          )),
        ],
      )),
    );
  }
}
