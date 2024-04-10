// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../components/txt.dart';

Widget textScreen() {
  return const Center(
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centers the buttons
            children: [
              Txt('Title!', fontSize: 24.0, isBold: true),
              Txt('Hello World'),
              Txt('Red text', color: Colors.red),
              Txt('Italic text', isItalic: true),
              Txt('Underlined text', isUnderline: true, color: Colors.blue),
            ],
          ),
        ],
      ),
    ),
  );
}
