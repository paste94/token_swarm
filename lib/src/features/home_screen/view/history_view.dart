import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/src/app/model/mini_token_model.dart';
import 'package:token_swarm/src/app/persistence/provider/persistence.dart';
import 'package:token_swarm/src/features/home_screen/widgets/history_list.dart';

class HistoryView extends ConsumerStatefulWidget {
  const HistoryView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HistoryViewState();
}

class _HistoryViewState extends ConsumerState<HistoryView> {
  bool itemEnabled = true;
  @override
  Widget build(BuildContext context) {
    final historyList = ref.read(persistenceProvider.notifier).get();

    return Container(
        key: UniqueKey(),
        child: FutureBuilder<List<MiniTokenModel>?>(
          future: historyList,
          builder: (
            BuildContext context,
            AsyncSnapshot<List<MiniTokenModel>?> snapshot,
          ) =>
              snapshot.hasData
                  ? HistoryList(data: snapshot.data!)
                  : const Center(child: Text('Press + button to add a token')),
        ));
  }
}






// class HistoryView extends ConsumerWidget {
//   const HistoryView({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final historyList = ref.read(persistenceProvider.notifier).get();
//     Widget _buildRow(MiniTokenModel token) {
//       return InkWell(
//         onTap: () async {
          
//           ref.read(tokenProvider.notifier).setTokenFromId(token.id);
//         },
//         onLongPress: () {
//           // TODO: Open dialog to delete item
//         },
//         child: ListTile(
//           leading: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CachedNetworkImage(
//               imageUrl: token.imageUri!,
//               progressIndicatorBuilder: (_, __, ___) => const Image(
//                 image: AssetImage('assets/img/mtg_rear.jpg'),
//               ),
//               errorWidget: (_, __, ___) => const SizedBox(
//                 child: Icon(Icons.image_not_supported),
//               ),
//             ),
//           ),
//           title: Text(token.name),
//           visualDensity: const VisualDensity(vertical: 4),
//         ),
//       );
//     }

//     return Container(
//         key: UniqueKey(),
//         child: FutureBuilder<List<MiniTokenModel>?>(
//           future: historyList,
//           builder: (
//             BuildContext context,
//             AsyncSnapshot<List<MiniTokenModel>?> snapshot,
//           ) =>
//               snapshot.hasData
//                   ? Column(
//                       children: [
//                         Text('Last used'),
//                         Expanded(
//                           child: ListView.separated(
//                             itemCount: snapshot.data!.length,
//                             itemBuilder: (BuildContext context, int i) {
//                               // return const Divider(height: 0);
//                               return _buildRow(snapshot.data![i]);
//                             },
//                             separatorBuilder:
//                                 (BuildContext context, int index) {
//                               return Divider(
//                                 height: 0,
//                               );
//                             },
//                             // children: snapshot.data!
//                             //     .map((e) => InkWell(
//                             //           onTap: () {
//                             //             // TODO: Open other view
//                             //           },
//                             //           onLongPress: () {
//                             //             // TODO: Open dialog to delete item
//                             //           },
//                             //           child: ListTile(
//                             //             leading: SizedBox(
//                             //               child: CachedNetworkImage(
//                             //                 imageUrl: e.imageUri!,
//                             //                 progressIndicatorBuilder:
//                             //                     (_, __, ___) => const Image(
//                             //                   image: AssetImage(
//                             //                       'assets/img/mtg_rear.jpg'),
//                             //                 ),
//                             //                 errorWidget: (_, __, ___) =>
//                             //                     const SizedBox(
//                             //                   child: Icon(
//                             //                       Icons.image_not_supported),
//                             //                 ),
//                             //               ),
//                             //             ),
//                             //             title: Text(e.name),
//                             //           ),
//                             //         ))
//                             //     .toList(),
//                           ),
//                         ),
//                       ],
//                     )
//                   : const Center(child: Text('Press + button to add a token')),
//         ));
//   }
// }

