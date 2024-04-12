import 'package:flutter/material.dart';

import '../components/input_text.dart';
import '../components/tag_input.dart';

Widget inputsScreen() {
  return Center(
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InputText(
            placeholder: "This is a simple text input",
          ),
          InputText(
            value: "",
            obscureText: false,
            placeholder: "Type an email here",
            type: InputType.email,
            prefixIcon: const Icon(Icons.email),
          ),
          InputText(
            value: "",
            placeholder: "Type password here",
            prefixIcon: const Icon(Icons.lock),
            type: InputType.password,
          ),
          InputText(value: "", obscureText: false, placeholder: "Type a number here", type: InputType.number),
          InputText(
            value: "",
            obscureText: false,
            placeholder: "Type a huge text",
            fontSize: 30,
            textAlign: TextAlign.center,
          ),
          TagInput(
            placeholder: "Type tags here",
          ),
          InputText(
            value: "Hello to multiline text",
            maxLines: 5,
            obscureText: false,
            placeholder: "Type something",
          ),
        ],
      ),
    ),
  );
}
