// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:liwe3/components/button.dart';
import 'package:liwe3/components/input_text.dart';
import 'package:liwe3/utils/secure_storage.dart';

import '../components/txt.dart';

Future<Widget> secureStorageScreen() async {
  var ss = SecureStorage();
  var value = await ss.read("test") ?? '';

  return Center(
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Txt('Secure Storage', fontSize: 24.0, isBold: true),
          const Txt('This is a demo of secure storage.'),
          Txt('Value: $value'),
          InputText(
            label: "New value",
            value: value,
            onChange: (v, _) {
              value = v;
            },
            showBorder: true,
          ),
          Button(
            label: "Save",
            onClick: (_) async {
              await ss.write("test", value);
            },
          ),
        ],
      ),
    ),
  );
}
