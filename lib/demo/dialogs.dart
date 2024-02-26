import 'package:flutter/material.dart';

import '../components/button.dart';
import '../components/dialog.dart';
import '../stores/theme.dart';
import '../utils/debug.dart';

Widget dialogsScreen() {
  void showDemoAlert() {
    alertDialog(
      title: "Alert",
      content: "This is an alert message",
      confirm: () {
        zprint("Alert confirmed");
      },
    );
  }

  void showDemoConfirm() {
    confirmDialog(
      title: "Confirm",
      content: "Are you sure?",
      confirm: () {
        zprint("Confirm confirmed");
      },
      cancel: () {
        zprint("Confirm canceled");
      },
    );
  }

  return Center(
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center, // Centers the buttons
            children: [
              Button(
                label: "Show Alert",
                mode: LiWETheme.error,
                onClick: (_) {
                  showDemoAlert();
                },
              ),
              const SizedBox(width: 10), // Adds a gap of 10 pixels
              Button(
                label: "Show Confirm",
                mode: LiWETheme.warn,
                onClick: (_) {
                  showDemoConfirm();
                },
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
