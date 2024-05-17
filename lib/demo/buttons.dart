import 'package:flutter/material.dart';
import 'package:liwe3/components/txt.dart';

import '../components/vscroll.dart';
import '../components/button.dart';
import '../stores/theme.dart';

Future<Widget> buttonsScreen() async {
  return VScroll(
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center, // Centers the buttons
        children: [
          Button(label: 'info', mode: LiWETheme.info),
          const SizedBox(width: 10), // Adds a gap of 10 pixels
          Button(label: 'warn', mode: LiWETheme.warn),
          const SizedBox(width: 10), // Adds a gap of 10 pixels
          Button(label: 'error', mode: LiWETheme.error),
          const SizedBox(width: 10), // Adds a gap of 10 pixels
          Button(label: 'success', mode: LiWETheme.success),
          const SizedBox(width: 10), // Adds a gap of 10 pixels
        ],
      ),
      Button(label: 'bigger', mode: LiWETheme.success, fontSize: 50),
      Button(label: 'Gradient', mode: LiWETheme.success, fontSize: 50, gradient: const [Colors.red, Colors.blue]),
      const Txt('Title!', fontSize: 24.0, isBold: true),
      const Txt('Hello World'),
      const Txt('Red text', color: Colors.red),
      const Txt('Italic text', isItalic: true),
      const Txt('Underlined text', isUnderline: true, color: Colors.blue),
      const Txt('Shader text', gradient: [Colors.red, Colors.blue, Colors.green]),
      const Txt('Shader text', gradient: [Colors.green, Colors.black], isBold: true),
      const Txt(
        'Shader text',
        gradient: [Colors.green, Colors.yellow, Colors.blue, Colors.black],
        isBold: true,
        fontSize: 30,
      ),
    ],
  );
}
