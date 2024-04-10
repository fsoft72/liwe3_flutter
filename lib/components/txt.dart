import 'package:flutter/material.dart';

class Txt extends StatelessWidget {
  final String txt;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final bool isBold;
  final bool isItalic;
  final bool isUnderline;
  final String? fontFamily;

  const Txt(
    this.txt, {
    super.key,
    this.color = Colors.black,
    this.fontSize = 14.0,
    this.fontWeight = FontWeight.normal,
    this.isBold = false,
    this.isItalic = false,
    this.isUnderline = false,
    this.fontFamily,
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
