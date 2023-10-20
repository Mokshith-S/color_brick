import 'package:color_brick/home/color_card.dart';
import 'package:flutter/material.dart';

class ColorBrickBlock extends StatelessWidget {
  const ColorBrickBlock(
      {super.key,
      required this.colorScheme,
      required this.changeInterface,
      required this.colorMap});
  final ColorScheme colorScheme;
  final void Function(int slideNumber, Color bgColor) changeInterface;
  final void Function(Map<String, Color>) colorMap;

  @override
  Widget build(BuildContext context) {
    Map<String, Color> colorSchemeProperty = {
      'primary': colorScheme.primary,
      'primaryContainer': colorScheme.primaryContainer,
      'onPrimary': colorScheme.onPrimary,
      'onPrimaryContainer': colorScheme.onPrimaryContainer,
      'secondary': colorScheme.secondary,
      'secondaryContainer': colorScheme.secondaryContainer,
      'onSecondary': colorScheme.onSecondary,
      'onSecondaryContainer': colorScheme.onSecondaryContainer,
      'error': colorScheme.error,
      'errorContainer': colorScheme.errorContainer,
      'onError': colorScheme.onError,
      'onErrorContainer': colorScheme.onErrorContainer,
      'surface': colorScheme.surface,
      'surfaceTint': colorScheme.surfaceTint,
      'surfaceVariant': colorScheme.surfaceVariant,
      'onSurface': colorScheme.onSurface,
      'onSurfaceVariant': colorScheme.onSurfaceVariant,
      'inversePrimary': colorScheme.inversePrimary,
      'inverseSurface': colorScheme.inverseSurface,
      'onInverseSurface': colorScheme.onInverseSurface,
      'tertiary': colorScheme.tertiary,
      'tertiaryContainer': colorScheme.tertiaryContainer,
      'onTertiary': colorScheme.onTertiary,
      'onTertiaryContainer': colorScheme.onTertiaryContainer,
      'background': colorScheme.background,
      'onBackground': colorScheme.onBackground,
      'outline': colorScheme.outline,
      'outlineVariant': colorScheme.outlineVariant,
      'scrim': colorScheme.scrim,
      'shadow': colorScheme.shadow,
    };
    colorMap(colorSchemeProperty);

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
