import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/src/app/const/measures.dart';
import 'package:token_swarm/src/features/home_screen/provider/token_provider.dart';
import 'package:token_swarm/src/features/home_screen/widgets/dialogs/edit_number_dialog.dart';
import 'package:token_swarm/src/features/home_screen/widgets/dialogs/edit_stats_dialog.dart';

class NumberSelector extends ConsumerWidget {
  const NumberSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var tokenNumber = ref.watch(tokenProvider)?.tokenNumber;
    return Column(
      children: [
        const IntrinsicHeight(
          child: Text('Tot'),
        ),
        IntrinsicHeight(
          child: Row(
            children: [
              IntrinsicWidth(
                child: IconButton(
                  icon: const Icon(Icons.remove),
                  padding: const EdgeInsets.symmetric(
                    vertical: 4.0,
                    horizontal: 18.0,
                  ),
                  iconSize: ICON_SIZE_S,
                  color: Theme.of(context).primaryColor,
                  onPressed: () =>
                      ref.read(tokenProvider.notifier).decreaseNumber(1),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => showDialog(
                      context: context,
                      builder: (context) {
                        return EditTokenNumberDialog();
                      }),
                  child: Text(
                    '$tokenNumber',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              IntrinsicWidth(
                child: Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.add),
                      padding: const EdgeInsets.symmetric(
                        vertical: 4.0,
                        horizontal: 18.0,
                      ),
                      iconSize: ICON_SIZE_S,
                      color: Theme.of(context).primaryColor,
                      onPressed: () =>
                          ref.read(tokenProvider.notifier).increaseNumber(1),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// class NumberSelector extends ConsumerStatefulWidget {
//   const NumberSelector({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _NumberSelectorState();
// }

// class _NumberSelectorState extends ConsumerState<NumberSelector> {
//   late TextEditingController _numberController;

//   void _removeButton() {
//     try {
//       int intVal = int.parse(_numberController.text);
//       if (intVal > 0) {
//         _numberController.text = '${intVal - 1}';
//         if (intVal - 1 < ref.read(tokenProvider)!.tappedNumber) {
//           ref.read(tokenProvider.notifier).setTappedNumber(intVal - 1);
//         }
//       }
//     } catch (e) {
//       _numberController.text = '0';
//     }
//   }

//   void _addButton() {
//     try {
//       int intVal = int.parse(_numberController.text);
//       _numberController.text = '${intVal + 1}';
//     } catch (e) {
//       _numberController.text = '0';
//     }
//   }

//   void _numberControllerListener() {
//     try {
//       ref
//           .read(tokenProvider.notifier)
//           .setTokenNumber(int.parse(_numberController.text));
//     } catch (e) {
//       ref.read(tokenProvider.notifier).setTokenNumber(0);
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _numberController = TextEditingController()
//       ..text = '${ref.read(tokenProvider)?.tokenNumber ?? '0'}';
//     _numberController.addListener(_numberControllerListener);
//   }

//   @override
//   void dispose() {
//     _numberController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     ref.listen(tokenProvider, (previous, next) {
//       if (previous!.tokenNumber != next!.tokenNumber) {
//         _numberController.text = '${next.tokenNumber}';
//       }
//     });
//     return Column(
//       children: [
//         const IntrinsicHeight(
//           child: Text('Tot'),
//         ),
//         IntrinsicHeight(
//           child: Row(
//             children: [
//               IntrinsicWidth(
//                 child: IconButton(
//                   icon: const Icon(Icons.remove),
//                   padding: const EdgeInsets.symmetric(
//                     vertical: 4.0,
//                     horizontal: 18.0,
//                   ),
//                   iconSize: ICON_SIZE_S,
//                   color: Theme.of(context).primaryColor,
//                   onPressed: _removeButton,
//                 ),
//               ),
//               Expanded(
//                 child: TextField(
//                   controller: _numberController,
//                   inputFormatters: [
//                     FilteringTextInputFormatter.digitsOnly,
//                   ],
//                   keyboardType: TextInputType.number,
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                     color: Colors.black87,
//                     fontSize: 18.0,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//               IntrinsicWidth(
//                 child: IconButton(
//                   icon: const Icon(
//                     Icons.add,
//                   ),
//                   padding: const EdgeInsets.symmetric(
//                     vertical: 4.0,
//                     horizontal: 18.0,
//                   ),
//                   iconSize: ICON_SIZE_S,
//                   color: Theme.of(context).primaryColor,
//                   onPressed: _addButton,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
