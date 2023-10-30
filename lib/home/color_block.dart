import 'package:color_brick/home/color_card.dart';
import 'package:color_brick/provider/colorscheme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ColorBrickBlock extends ConsumerWidget {
  const ColorBrickBlock({
    super.key,
    required this.changeInterface,
  });

  final void Function(int slideNumber, Color bgColor) changeInterface;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorSchemeProperty = ref.read(colorSchemeColorProvider);
    return Expanded(
      child: ListView.builder(
        itemCount: colorSchemeProperty.keys.length,
        itemBuilder: (ctx, position) => GestureDetector(
          onTap: () {
            changeInterface(
                2,
                colorSchemeProperty[
                    colorSchemeProperty.keys.toList()[position]]!);
          },
          child: ColorCard(
            backgroundColor: colorSchemeProperty[
                colorSchemeProperty.keys.toList()[position]]!,
            colorName: colorSchemeProperty.keys.toList()[position],
          ),
        ),
      ),
    );
  }
}
