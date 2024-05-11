import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget VScroll({
  Key? key,
  required List<Widget> children,
  int paddingLeft = 0,
  int paddingRight = 0,
  int paddingTop = 0,
  int paddingBottom = 0,
}) {
  return SingleChildScrollView(
    key: key,
    padding: EdgeInsets.only(
      left: paddingLeft.toDouble(),
      right: paddingRight.toDouble(),
      top: paddingTop.toDouble(),
      bottom: paddingBottom.toDouble(),
    ),
    child: Column(
      children: children,
    ),
  );
}
