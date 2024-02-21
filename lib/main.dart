import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liwe3_flutter/liwe3/components/button.dart';
import 'package:liwe3_flutter/liwe3/components/input_text.dart';
import 'package:liwe3_flutter/liwe3/components/tag_input.dart';
import 'package:liwe3_flutter/liwe3/debug.dart';
import 'package:liwe3_flutter/liwe3/components/dialog.dart';
import 'package:liwe3_flutter/liwe3/stores/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InputText(
                value: "Hello",
                obscureText: false,
                placeholder: "Type something",
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
              TagInput(),
              InputText(
                value: "Hello",
                maxLines: 5,
                obscureText: false,
                placeholder: "Type something",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
