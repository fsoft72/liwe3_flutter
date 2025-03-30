import 'package:flutter/material.dart';

import 'package:liwe3/utils/debug.dart';
import 'package:liwe3/components/vscroll.dart';
import 'package:liwe3/components/input_text.dart';
import 'package:liwe3/components/tag_input.dart';

Future<Widget> inputsScreen() async {
  return VScroll(
    paddingLeft: 15,
    paddingRight: 15,
    children: <Widget>[
      InputText(
        placeholder: "This is a simple text input",
      ),
      const SizedBox(height: 10),
      InputText(
        value: "",
        placeholder: "Type an email here",
        type: InputType.email,
        prefixIcon: const Icon(Icons.email),
      ),
      const SizedBox(height: 10),
      InputText(
        value: "",
        placeholder: "Type password here",
        prefixIcon: const Icon(Icons.lock),
        type: InputType.password,
      ),
      const SizedBox(height: 10),
      InputText(value: "", obscureText: false, placeholder: "Type a number here", type: InputType.number),
      const SizedBox(height: 10),
      InputText(
        value: "",
        placeholder: "Type a huge text",
        fontSize: 30,
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 10),
      InputText(
        value: "",
        placeholder: "Type a number here",
        type: InputType.number,
        label: "A label",
        borderColor: Colors.blue,
      ),
      const SizedBox(height: 10),
      TagInput(
        placeholder: "Type tags here",
        onChange: (tags) {
          zprint("=== Tags: $tags");
        },
      ),
      const SizedBox(height: 10),
      InputText(
        value: "Hello to multiline text",
        maxLines: 5,
        placeholder: "Type something",
      ),
    ],
  );
}
