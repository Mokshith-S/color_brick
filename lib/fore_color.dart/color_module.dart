import 'package:color_brick/provider/colorscheme_provider.dart';
import 'package:color_brick/provider/font_color_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorModule extends ConsumerWidget {
  const ColorModule({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final fontColor = ref.read(fontColorProvider);
    final colors = ref.read(colorSchemeColorProvider);

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2,
      ),
      itemCount: colors.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => ref
              .read(fontColorProvider.notifier)
              .changeFontColor(colors[colors.keys.toList()[index]]!),
          child: Container(
            decoration: BoxDecoration(
              color: colors[colors.keys.toList()[index]],
              border: Border.all(
                width: 1,
                color: Colors.white,
              ),
            ),
            child: Container(
              color: Colors.white10,
              child: Center(
                child: Text(
                  colors.keys.toList()[index],
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
