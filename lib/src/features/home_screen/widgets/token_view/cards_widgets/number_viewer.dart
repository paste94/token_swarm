import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NumberViewer extends ConsumerWidget {
  const NumberViewer({
    super.key,
    required this.number,
  });

  final int number;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      '$number',
      style: TextStyle(
        fontSize: 24, // Set the desired font size here
        fontWeight: FontWeight.bold, // Optional: Make the text bold
      ),
    );
  }
}
