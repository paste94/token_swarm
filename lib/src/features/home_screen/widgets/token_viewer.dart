import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/src/app/common_widgets/mtg_card_image_viewer.dart';
import 'package:token_swarm/src/app/const/measures.dart';
import 'package:token_swarm/src/features/home_screen/provider/token_provider.dart';
import 'package:token_swarm/src/features/home_screen/widgets/edit_stats_dialog.dart';

class TokenViewer extends ConsumerWidget {
  const TokenViewer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final token = ref.watch(tokenProvider)!;
    return Column(children: [
      Column(
        children: [
          MtgCardImageViewer(myCard: token.selectedToken),
          token.power == null || token.toughness == null
              ? const Divider(
                  color: Colors.transparent,
                )
              : Align(
                  alignment: Alignment.topRight,
                  widthFactor: 4.5,
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const EditStatsDialog();
                          });
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: DOUBLE_PADDING,
                        ),
                        child: Text(
                          '${token.power}/${token.toughness}',
                          style: TextStyle(fontSize: P_T_FONT_SIZE),
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    ]);
  }
}
