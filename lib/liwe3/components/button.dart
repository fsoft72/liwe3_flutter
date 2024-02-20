import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String label;
  final Function()? onPressed;
  final Color? backgroundColor;
  final Color? color;
  final double? borderRadius;
  final double? border;
  final Color? borderColor;

  const Button({
    super.key,
    required this.label,
    this.onPressed,
    this.backgroundColor,
    this.color,
    this.borderRadius = 10,
    this.border = 1.0,
    this.borderColor = Colors.transparent,
  });

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
        if (onPressed != null) {
          onPressed!();
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
