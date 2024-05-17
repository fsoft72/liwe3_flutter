import 'package:flutter/material.dart';

import '../utils/intenals.dart';
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
  final List<Color>? gradient;
  double? fontSize;

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
    this.fontSize,
    this.gradient,
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
    // ignore: no_leading_underscores_for_local_identifiers
    Widget _mkButton({required Color bgColor, required Color shadowColor}) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor, // sets the background color
          shadowColor: shadowColor, // sets the shadow color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 0),
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
            fontSize: fontSize,
          ),
        ),
      );
    }

    if (gradient != null) {
      List<double> stops = generateStops(gradient!.length);

      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradient!,
            stops: stops,
          ),
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
        ),
        child: _mkButton(
          bgColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
      );
    }

    return _mkButton(
      bgColor: backgroundColor!,
      shadowColor: Colors.transparent,
    );
  }
}
