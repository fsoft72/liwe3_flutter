import 'package:flutter/material.dart';
import 'package:liwe3/components/markdown.dart';

import '../components/vscroll.dart';
import '../components/button.dart';
import '../components/dialog.dart';
import '../stores/theme.dart';
import '../utils/debug.dart';

Future<Widget> dialogsScreen() async {
  void showDemoAlert() async {
    var res = (await alertDialog(
          title: "Alert",
          content: "This is an alert message",
          confirm: () {
            zprint("Alert confirmed");
          },
        )) ??
        false;

    zprint("=== RESULT: $res");
  }

  void showDemoConfirm() async {
    bool result = (await confirmDialog(
          title: "Confirm",
          content: "Are you sure?",
          confirm: () {
            zprint("Confirm confirmed");
          },
          cancel: () {
            zprint("Confirm canceled");
          },
        )) ??
        false;

    zprint("=== RESULT: $result");
  }

  return Center(
    child: VScroll(
      children: <Widget>[
        const MarkdownView(
          text: "**Hello World**\n\nThis is a *text* in *italic*",
          fontSize: 30.0,
        ),
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
  );
}
