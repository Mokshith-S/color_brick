import 'package:color_brick/fore_color.dart/fore_color.dart';
import 'package:color_brick/home/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ColorBrickBranch());
}

class ColorBrickBranch extends StatefulWidget {
  const ColorBrickBranch({super.key});

  @override
  State<ColorBrickBranch> createState() => _ColorBrickBrachState();
}

class _ColorBrickBrachState extends State<ColorBrickBranch> {
  Widget? screen;
  ColorScheme? generatedColorScheme;
  int? alpha;
  int? red;
  int? green;
  int? blue;
  Map<String, Color> globalMap = {};

  List<Object?> get selectedColorValue =>
      [generatedColorScheme, alpha, red, green, blue];

  void setColorScheme(ColorScheme clrScheme, int a, int r, int g, int b) {
    generatedColorScheme = clrScheme;
    alpha = a;
    red = r;
    green = g;
    blue = b;
  }

  void colorBrickMap(Map<String, Color> colorMap) {
    globalMap.clear();
    globalMap.addAll(colorMap);
  }

  Map<String, Color> get getColors => globalMap;

  void changeScreen(int slideNumber, Color? bgclr) {
    setState(() {
      if (slideNumber == 1) {
        screen = ColorBrickHome(
          changeInterface: changeScreen,
          setGobalScheme: setColorScheme,
          selectedColorInfo: selectedColorValue,
          colorMap: colorBrickMap,
        );
      } else if (slideNumber == 2) {
        screen = ColorBrickForeground(
          backgroundClr: bgclr!,
          getColorMap: getColors,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        appBarTheme: AppBarTheme(
          titleTextStyle: GoogleFonts.balooBhai2(
            letterSpacing: 1,
            fontSize: 24,
            color: const Color.fromARGB(255, 112, 27, 160),
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    screen = ColorBrickHome(
                      changeInterface: changeScreen,
                      setGobalScheme: setColorScheme,
                      selectedColorInfo: selectedColorValue,
                      colorMap: colorBrickMap,
                    );
                  });
                },
                color: const Color.fromARGB(255, 112, 27, 160),
                icon: const Icon(Icons.home_rounded))
          ],
          title: const Text(
            "Color Brick",
          ),
          backgroundColor: const Color.fromARGB(255, 252, 245, 95),
        ),
        body: screen ??
            ColorBrickHome(
              changeInterface: changeScreen,
              setGobalScheme: setColorScheme,
              selectedColorInfo: selectedColorValue,
              colorMap: colorBrickMap,
            ),
      ),
    );
  }
}
