import 'package:color_brick/fore_color.dart/fore_color.dart';
import 'package:color_brick/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    const ProviderScope(
      child: ColorBrickBranch(),
    ),
  );
}

class ColorBrickBranch extends StatefulWidget {
  const ColorBrickBranch({super.key});

  @override
  State<ColorBrickBranch> createState() => _ColorBrickBrachState();
}

class _ColorBrickBrachState extends State<ColorBrickBranch> {
  Widget? screen;

  void changeScreen(int slideNumber, Color? bgclr) {
    setState(() {
      if (slideNumber == 1) {
        screen = ColorBrickHome(
          changeInterface: changeScreen,
        );
      } else if (slideNumber == 2) {
        screen = ColorBrickForeground(
          backgroundClr: bgclr!,
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
          titleTextStyle: GoogleFonts.montserrat(
            letterSpacing: 1,
            fontSize: 24,
            color: const Color.fromARGB(255, 255, 255, 255),
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
                    );
                  });
                },
                color: const Color.fromARGB(255, 255, 255, 255),
                icon: const Icon(Icons.home_rounded))
          ],
          title: const Text(
            "Color Brick",
          ),
          backgroundColor: const Color.fromARGB(255, 80, 94, 163),
        ),
        body: screen ??
            ColorBrickHome(
              changeInterface: changeScreen,
            ),
      ),
    );
  }
}
