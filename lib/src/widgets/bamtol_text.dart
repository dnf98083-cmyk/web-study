import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BamtolText extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? weight;
  final Color? color;
  final TextAlign? textAlign;
  final double? height;

  const BamtolText(
    this.text, {
    super.key,
    this.size,
    this.weight,
    this.color,
    this.textAlign,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.notoSans(
        fontSize: size ?? 14,
        fontWeight: weight ?? FontWeight.normal,
        color: color ?? Colors.white,
        height: height,
      ),
    );
  }
}
