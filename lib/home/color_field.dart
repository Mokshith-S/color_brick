import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorField extends ConsumerStatefulWidget {
  const ColorField(
      {super.key, required this.colorCode, required this.controlAgent});
  final Color colorCode;
  final TextEditingController controlAgent;

  @override
  ConsumerState<ColorField> createState() => _ColorFieldState();
}

class _ColorFieldState extends ConsumerState<ColorField> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        style: GoogleFonts.montserrat(
            color: Colors.white, fontWeight: FontWeight.bold),
        inputFormatters: [LengthLimitingTextInputFormatter(3)],
        keyboardType: TextInputType.number,
        controller: widget.controlAgent,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.square_rounded),
          prefixIconColor: widget.colorCode,
        ),
      ),
    );
  }
}
