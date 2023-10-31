import 'package:color_brick/provider/brightness_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ColorSchemeNotifier extends StateNotifier<List<int>> {
  ColorSchemeNotifier() : super([]);

  void getColorSchemeValue(int alpha, int red, int green, int blue) {
    state = [alpha, red, green, blue];
  }
}

final colorSchemeProvider =
    StateNotifierProvider<ColorSchemeNotifier, List<int>>(
        (ref) => ColorSchemeNotifier());

final colorSchemeColorProvider = Provider((ref) {
  final colorSchemeValue = ref.watch(colorSchemeProvider);
  final int a = colorSchemeValue[0];
  final int r = colorSchemeValue[1];
  final int g = colorSchemeValue[2];
  final int b = colorSchemeValue[3];
  final brightness = ref.watch(brightnessProvider);

  final colorScheme = ColorScheme.fromSeed(
    seedColor: Color.fromARGB(a, r, g, b),
    brightness: brightness,
  );

  return {
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
});
