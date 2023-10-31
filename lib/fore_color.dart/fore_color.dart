import 'package:color_brick/fore_color.dart/color_module.dart';
import 'package:color_brick/provider/font_color_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorBrickForeground extends ConsumerWidget {
  const ColorBrickForeground({
    super.key,
    required this.backgroundClr,
  });
  final Color backgroundClr;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: backgroundClr,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 60),
            child: Text(
              'Color Brick',
              style: GoogleFonts.montserrat(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: ref.watch(fontColorProvider)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 3),
                ),
              ),
              child: const ColorModule(),
            ),
          )
        ],
      ),
    );
  }
}
