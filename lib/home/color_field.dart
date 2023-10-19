import 'package:flutter/material.dart';

class ColorField extends StatefulWidget {
  const ColorField(
      {super.key, required this.colorCode, required this.controlAgent});
  final Color colorCode;
  final TextEditingController controlAgent;

  @override
  State<ColorField> createState() => _ColorFieldState();
}

class _ColorFieldState extends State<ColorField> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
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
