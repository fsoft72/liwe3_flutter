import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final int length;
  final int index;
  final Color activeColor;
  final Color dotColor;

  const PageIndicator({
    super.key,
    required this.index,
    required this.length,
    required this.activeColor,
    required this.dotColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (i) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.linear,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            width: index == i ? 14 : 8,
            height: 8,
            decoration: BoxDecoration(
              color: index == i ? activeColor : dotColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(40),
              ),
            ),
          );
        },
      ),
    );
  }
}
