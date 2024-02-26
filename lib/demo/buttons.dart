import 'package:flutter/material.dart';

import '../components/button.dart';
import '../stores/theme.dart';

Widget buttonsScreen() {
  return Center(
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
            ],
          ),
        ],
      ),
    ),
  );
}
