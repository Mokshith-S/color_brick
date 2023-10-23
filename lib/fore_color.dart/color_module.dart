import 'dart:ui';

import 'package:flutter/material.dart';

class ColorModule extends StatelessWidget {
  const ColorModule({
    super.key,
    required this.colors,
    required this.changeFontColor,
  });
  final Map<String, Color> colors;
  final void Function(Color) changeFontColor;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2,
      ),
      itemCount: colors.length,
      itemBuilder: (context, index) {
        return Container(
          alignment: Alignment.topLeft,
          child: TextButton(
            onPressed: () {
              changeFontColor(colors[colors.keys.toList()[index]]!);
              Navigator.pop(context);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Icon(
                    Icons.square_rounded,
                    size: 18,
                    color: colors[colors.keys.toList()[index]],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(colors.keys.toList()[index]),
              ],
            ),
          ),
        );
      },
    );
  }
}
