import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MarkdownView extends StatelessWidget {
  final String text;
  final double fontSize;

  const MarkdownView({
    super.key,
    required this.text,
    this.fontSize = 20.0, // set a default value
  });

  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
      data: text,
      styleSheet: MarkdownStyleSheet(
        p: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: fontSize),
      ),
    );
  }
}
