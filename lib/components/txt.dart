// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

import '../utils/intenals.dart';

class Txt extends StatelessWidget {
  final String txt;
  final FontWeight fontWeight;
  final bool isBold;
  final bool isItalic;
  final bool isUnderline;
  final String? fontFamily;
  final Color? color;
  final double? fontSize;
  final List<Color>? gradient;

  const Txt(
    this.txt, {
    super.key,
    this.fontWeight = FontWeight.normal,
    this.isBold = false,
    this.isItalic = false,
    this.isUnderline = false,
    this.fontFamily,
    this.color,
    this.fontSize,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    Widget _mkTxt() {
      return Text(
        txt,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: isBold ? FontWeight.bold : fontWeight,
          fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
          decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
          fontFamily: fontFamily,
        ),
      );
    }

    // if colors is not null, define stops so that the first is 0, the last is 1, and the is calculated
    // based on the length of the colors list
    if (gradient != null) {
      List<double> stops = generateStops(gradient!.length);

      return ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: (bounds) => LinearGradient(
          colors: gradient!,
          stops: stops,
        ).createShader(
          Rect.fromLTWH(10, 0, bounds.width, bounds.height),
        ),
        child: _mkTxt(),
      );
    }

    return _mkTxt();
  }
}
