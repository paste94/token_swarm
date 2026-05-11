import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FullImageView extends ConsumerWidget {
  const FullImageView({super.key, required this.imageUri});
  final String imageUri;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Full Image View'),
      ),
      body: Center(
        child: Image.network(
          imageUri,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Text('Failed to load image');
          },
        ),
      ),
    );
  }
}
