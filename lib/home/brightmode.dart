import 'package:color_brick/provider/brightness_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BrightMode extends ConsumerWidget {
  const BrightMode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final brightValue = ref.watch(brightnessProvider);
    IconData brightnessIcon = brightValue == Brightness.light
        ? Icons.dark_mode_outlined
        : Icons.light_mode_outlined;
    return IconButton(
      onPressed: () {
        ref.read(brightnessProvider.notifier).controllBrightness();
      },
      icon: Icon(brightnessIcon),
    );
  }
}
