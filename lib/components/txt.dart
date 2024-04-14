import 'package:flutter/material.dart';

class Txt extends StatelessWidget {
  final String txt;
  final FontWeight fontWeight;
  final bool isBold;
  final bool isItalic;
  final bool isUnderline;
  final String? fontFamily;
  final Color? color;
  final double? fontSize;

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
  });

  @override
  Widget build(BuildContext context) {
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
}
