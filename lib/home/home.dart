import 'package:color_brick/home/brightmode.dart';
import 'package:color_brick/home/color_block.dart';
import 'package:color_brick/home/color_field.dart';
import 'package:color_brick/provider/colorscheme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorBrickHome extends ConsumerStatefulWidget {
  const ColorBrickHome({
    super.key,
    required this.changeInterface,
  });

  final void Function(int slideNumber, Color bgColor) changeInterface;

  @override
  ConsumerState<ColorBrickHome> createState() => _ColorBrickHomeState();
}

class _ColorBrickHomeState extends ConsumerState<ColorBrickHome> {
  TextEditingController? redController;
  TextEditingController? greenController;
  TextEditingController? blueController;
  TextEditingController? opacityController;

  bool colorBlock = false;

  @override
  void dispose() {
    redController!.dispose();
    greenController!.dispose();
    blueController!.dispose();
    opacityController!.dispose();
    super.dispose();
  }

  void generateColor() {
    colorBlock = true;
    String errorMsg = '';
    int? alpha = int.tryParse(opacityController!.text);
    int? red = int.tryParse(redController!.text);
    int? green = int.tryParse(greenController!.text);
    int? blue = int.tryParse(blueController!.text);

    if (alpha != null && red != null && green != null && blue != null) {
      if ((0 <= alpha && alpha <= 255) &&
          (0 <= red && red <= 255) &&
          (0 <= green && green <= 255) &&
          (0 <= blue && blue <= 255)) {
        ref
            .read(colorSchemeProvider.notifier)
            .getColorSchemeValue(alpha, red, green, blue);

        FocusScope.of(context).unfocus();
        return;
      } else {
        errorMsg = 'Invalid color code';
      }
    } else {
      errorMsg = 'Enter value between 0 and 255';
    }
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          )
        ],
        title: Text(
          errorMsg,
          style: GoogleFonts.montserrat(
              color: Colors.white, fontWeight: FontWeight.w600),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 146, 146),
      ),
    );
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final initialColorValue = ref.watch(colorSchemeProvider);
    redController = TextEditingController()
      ..text = initialColorValue[1].toString();

    greenController = TextEditingController()
      ..text = initialColorValue[2].toString();

    blueController = TextEditingController()
      ..text = initialColorValue[3].toString();

    opacityController = TextEditingController()
      ..text = initialColorValue[0].toString();

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
              controlAgent: redController!,
            ),
            const SizedBox(
              width: 10,
            ),
            ColorField(
              colorCode: Colors.green,
              controlAgent: greenController!,
            ),
            const SizedBox(
              width: 10,
            ),
            ColorField(
              colorCode: Colors.blue,
              controlAgent: blueController!,
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
            const BrightMode(),
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
        if (colorBlock)
          ColorBrickBlock(
            changeInterface: widget.changeInterface,
          ),
      ],
    );
  }
}
