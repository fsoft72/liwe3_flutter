import 'package:flutter/material.dart';

import '../stores/theme.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  final String label;
  final Function(dynamic)? onClick;
  final LiWETheme mode;

  late Color? backgroundColor;
  late Color? color;
  late double? borderRadius;
  late double? border;
  late Color? borderColor;

  Button({
    super.key,
    required this.label,
    this.onClick,
    this.mode = LiWETheme.info,
    double? borderRadius,
    double? border,
    Color? borderColor,
    Color? backgroundColor,
    Color? color,
  }) {
    Map<String, Color?> cols = theme.getVariant(mode);

    this.backgroundColor = backgroundColor ?? cols["backgroundColor"];
    this.color = color ?? cols["color"];
    this.borderRadius = borderRadius ?? theme.borderRadius.value;
    this.border = 1.0;
    this.borderColor = borderColor ?? cols["borderColor"];
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor, // sets the background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
          side: BorderSide(
            color: borderColor ?? Colors.transparent,
            width: border ?? 0,
          ),
        ),
      ),
      onPressed: () {
        if (onClick != null) {
          onClick!(this);
        }
      },
      child: Text(
        label,
        style: TextStyle(
          color: color,
        ),
      ),
    );
  }
}
