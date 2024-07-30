import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/src/app/const/measures.dart';
import 'package:token_swarm/src/features/home_screen/provider/token_provider.dart';
import 'package:token_swarm/src/features/home_screen/widgets/dialogs/edit_tapped_dialog.dart';

class TappedSelector extends ConsumerWidget {
  const TappedSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tappedNumber = ref.watch(tokenProvider)?.tappedNumber;
    return Column(
      children: [
        const IntrinsicHeight(
          child: Text('Tapped'),
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
                      ref.read(tokenProvider.notifier).decreaseTapped(1),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => showDialog(
                      context: context,
                      builder: (context) {
                        return EditTappedNumberDialog();
                      }),
                  child: Text(
                    '$tappedNumber',
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
                child: IconButton(
                  icon: const Icon(
                    Icons.add,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 4.0,
                    horizontal: 18.0,
                  ),
                  iconSize: ICON_SIZE_S,
                  color: Theme.of(context).primaryColor,
                  onPressed: () =>
                      ref.read(tokenProvider.notifier).increaseTapped(1),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}




// class TappedSelector extends ConsumerStatefulWidget {
//   const TappedSelector({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _TappedSelectorState();
// }

// class _TappedSelectorState extends ConsumerState<TappedSelector> {
//   late TextEditingController _controller;

//   void _removeButton() {
//     try {
//       int intVal = int.parse(_controller.text);
//       if (intVal > 0) {
//         _controller.text = '${intVal - 1}';
//       }
//     } catch (e) {
//       _controller.text = '0';
//     }
//   }

//   void _addButton() {
//     try {
//       int tappedNumber = ref.read(tokenProvider)!.tappedNumber;
//       int intVal = int.parse(_controller.text);

//       if (intVal + 1 <= tappedNumber) {
//         _controller.text = '${intVal + 1}';
//       }
//     } catch (e) {
//       _controller.text = '0';
//     }
//   }

//   void _controllerListener() {
//     try {
//       ref
//           .read(tokenProvider.notifier)
//           .setTappedNumber(int.parse(_controller.text));
//     } catch (e) {
//       ref.read(tokenProvider.notifier).setTappedNumber(0);
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _controller = TextEditingController()
//       ..text = '${ref.read(tokenProvider)?.tappedNumber ?? '0'}';
//     _controller.addListener(_controllerListener);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     ref.listen(tokenProvider, (previous, next) {
//       if (previous?.tappedNumber != next?.tappedNumber) {
//         _controller.text = '${next?.tappedNumber}';
//       }
//     });
//     return Column(
//       children: [
//         const IntrinsicHeight(
//           child: Text('Tapped'),
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
//                   controller: _controller,
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
