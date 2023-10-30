import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BrightnessNotifier extends StateNotifier<Brightness> {
  BrightnessNotifier() : super(Brightness.light);

  void controllBrightness() {
    state = (state == Brightness.light ? Brightness.dark : Brightness.light);
  }
}

final brightnessProvider =
    StateNotifierProvider<BrightnessNotifier, Brightness>(
        (ref) => BrightnessNotifier());
