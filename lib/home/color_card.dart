import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stroke_text/stroke_text.dart';

class ColorCard extends StatelessWidget {
  const ColorCard(
      {super.key, required this.backgroundColor, required this.colorName});
  final Color backgroundColor;
  final String colorName;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Colors.black)),
      color: backgroundColor,
      child: SizedBox(
        height: 60,
        child: Center(
          child: StrokeText(
            text: colorName,
            textColor: Colors.black,
            textStyle: GoogleFonts.montserrat(
              fontSize: 20,
              letterSpacing: 0.5,
              fontWeight: FontWeight.bold,
            ),
            strokeWidth: 4,
            strokeColor: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
    );
  }
}
