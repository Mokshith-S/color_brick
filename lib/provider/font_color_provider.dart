import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class FontColorNotifier extends StateNotifier<Color> {
  FontColorNotifier() : super(Colors.black);

  void changeFontColor(Color color) {
    state = color;
  }
}

final fontColorProvider = StateNotifierProvider<FontColorNotifier, Color>(
    (ref) => FontColorNotifier());
