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
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      itemCount: (colors.length ~/ 2) - 1,
      itemBuilder: (context, index) {
        List<Widget> setsOfRows = [];
        for (int interCounter = index * 2;
            interCounter <= index * 2 + 1;
            interCounter++) {
          setsOfRows.add(
            TextButton(
              onPressed: () {
                changeFontColor(colors[colors.keys.toList()[interCounter]]!);
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  if (index * 2 == interCounter)
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Icon(
                        Icons.square_rounded,
                        size: 18,
                        color: colors[colors.keys.toList()[interCounter]],
                      ),
                    ),
                  if (index * 2 == interCounter)
                    const SizedBox(
                      width: 6,
                    ),
                  if (index * 2 == interCounter)
                    Text(colors.keys.toList()[interCounter]),
                  if (index * 2 + 1 == interCounter)
                    Text(colors.keys.toList()[interCounter]),
                  if (index * 2 + 1 == interCounter)
                    const SizedBox(
                      width: 6,
                    ),
                  if (index * 2 + 1 == interCounter)
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Icon(
                        Icons.square_rounded,
                        size: 18,
                        color: colors[colors.keys.toList()[interCounter]],
                      ),
                    ),
                ],
              ),
            ),
          );
          if (index * 2 == interCounter) setsOfRows.add(const Spacer());
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: setsOfRows,
        );
      },
    );
  }
}
