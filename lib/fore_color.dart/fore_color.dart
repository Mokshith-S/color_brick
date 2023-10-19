import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorBrickForeground extends StatefulWidget {
  const ColorBrickForeground({super.key, required this.backgroundClr});
  final Color backgroundClr;
  @override
  State<ColorBrickForeground> createState() => _ColorBrickForegroundState();
}

class _ColorBrickForegroundState extends State<ColorBrickForeground> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: widget.backgroundClr,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Color Brick',
            style: GoogleFonts.montserrat(
                fontSize: 21, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
