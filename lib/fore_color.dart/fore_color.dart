import 'package:color_brick/fore_color.dart/color_module.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorBrickForeground extends StatefulWidget {
  const ColorBrickForeground(
      {super.key, required this.backgroundClr, required this.getColorMap});
  final Color backgroundClr;
  final Map<String, Color> getColorMap;

  @override
  State<ColorBrickForeground> createState() => _ColorBrickForegroundState();
}

class _ColorBrickForegroundState extends State<ColorBrickForeground> {
  Color fontColor = Colors.black;

  void changeFontColor(Color color) {
    setState(() {
      fontColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: widget.backgroundClr,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Text(
              'Color Brick',
              style: GoogleFonts.montserrat(
                  fontSize: 24, fontWeight: FontWeight.w700, color: fontColor),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.only(
                  topEnd: Radius.circular(30),
                  topStart: Radius.circular(30),
                )),
                context: context,
                builder: (ctx) => Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2),
                    borderRadius: const BorderRadiusDirectional.only(
                      topStart: Radius.circular(30),
                      topEnd: Radius.circular(30),
                    ),
                  ),
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  height: 350,
                  child: ColorModule(
                    colors: widget.getColorMap,
                    changeFontColor: changeFontColor,
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 2,
                ),
                borderRadius: const BorderRadiusDirectional.only(
                  topStart: Radius.circular(30),
                  topEnd: Radius.circular(30),
                ),
              ),
              height: 60,
              width: double.infinity,
              child: Center(
                child: Text(
                  'Text Color',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
