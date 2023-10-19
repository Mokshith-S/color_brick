import 'package:color_brick/home/color_block.dart';
import 'package:color_brick/home/color_field.dart';
import 'package:flutter/material.dart';

class ColorBrickHome extends StatefulWidget {
  const ColorBrickHome(
      {super.key, required this.changeInterface, required this.setGobalScheme});

  final void Function(int slideNumber, Color bgColor) changeInterface;
  final void Function(ColorScheme) setGobalScheme;

  @override
  State<ColorBrickHome> createState() => _ColorBrickHomeState();
}

class _ColorBrickHomeState extends State<ColorBrickHome> {
  final redController = TextEditingController();
  final greenController = TextEditingController();
  final blueController = TextEditingController();
  final opacityController = TextEditingController();
  ColorScheme? generateColorScheme;

  @override
  void dispose() {
    redController.dispose();
    greenController.dispose();
    blueController.dispose();
    opacityController.dispose();
    super.dispose();
  }

  void generateColor() {
    int alpha = int.parse(opacityController.text);
    int red = int.parse(redController.text);
    int green = int.parse(greenController.text);
    int blue = int.parse(blueController.text);
    setState(
      () {
        generateColorScheme = ColorScheme.fromSeed(
          seedColor: Color.fromARGB(alpha, red, green, blue),
        );
      },
    );
    widget.setGobalScheme(generateColorScheme!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            ColorField(
              colorCode: Colors.red,
              controlAgent: redController,
            ),
            const SizedBox(
              width: 10,
            ),
            ColorField(
              colorCode: Colors.green,
              controlAgent: greenController,
            ),
            const SizedBox(
              width: 10,
            ),
            ColorField(
              colorCode: Colors.blue,
              controlAgent: blueController,
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width / 3 - 15,
              child: TextField(
                controller: opacityController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Opacity',
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 141, 126, 126),
                      letterSpacing: 0.5),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            TextButton(
              onPressed: generateColor,
              child: const Row(
                children: [
                  Text(
                    'Generate',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.purpleAccent),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.anchor,
                    color: Colors.purpleAccent,
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          height: 1,
          color: Colors.black,
        ),
        if (generateColorScheme != null)
          ColorBrickBlock(
            colorScheme: generateColorScheme!,
            changeInterface: widget.changeInterface,
          ),
      ],
    );
  }
}
