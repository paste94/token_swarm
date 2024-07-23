// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/src/app/const/measures.dart';

class TappedSelector extends ConsumerStatefulWidget {
  const TappedSelector({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TappedSelectorState();
}

class _TappedSelectorState extends ConsumerState<TappedSelector> {
  final TextEditingController number = TextEditingController()..text = '0';

  VoidCallback? addButton() {
    try {
      int intVal = int.parse(number.text);
      if (intVal > 0) {
        number.text = '${intVal - 1}';
      }
    } catch (e) {
      number.text = '0';
    }
  }

  VoidCallback? removeButton() {
    try {
      int intVal = int.parse(number.text);
      number.text = '${intVal + 1}';
    } catch (e) {
      number.text = '0';
    }
  }

  @override
  void dispose() {
    number.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntrinsicHeight(
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
                  onPressed: addButton,
                ),
              ),
              Expanded(
                child: TextField(
                  controller: number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
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
                  onPressed: removeButton,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
