import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:token_swarm/src/app/const/measures.dart';
import 'package:token_swarm/src/features/home_screen/provider/token_provider.dart';

class NumberSelector extends ConsumerStatefulWidget {
  const NumberSelector({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NumberSelectorState();
}

class _NumberSelectorState extends ConsumerState<NumberSelector> {
  late TextEditingController _controller;

  void addButton() {
    try {
      int intVal = int.parse(_controller.text);
      if (intVal > 0) {
        _controller.text = '${intVal - 1}';
      }
    } catch (e) {
      _controller.text = '0';
    }
  }

  void removeButton() {
    try {
      int intVal = int.parse(_controller.text);
      _controller.text = '${intVal + 1}';
    } catch (e) {
      _controller.text = '0';
    }
  }

  void controllerListener() {
    try {
      ref
          .read(tokenProvider.notifier)
          .setTokenNumber(int.parse(_controller.text));
    } catch (e) {
      ref.read(tokenProvider.notifier).setTokenNumber(0);
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController()
      ..text = '${ref.read(tokenProvider)?.tokenNumber ?? '0'}';
    _controller.addListener(controllerListener);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  onPressed: addButton,
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _controller,
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
