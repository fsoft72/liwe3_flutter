import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

// ignore: must_be_immutable
class MarkdownView extends StatelessWidget {
  late String text;

  MarkdownView({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
      data: text,
    );
  }
}
