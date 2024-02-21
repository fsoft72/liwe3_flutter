// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputText extends StatelessWidget {
  final RxString text = ''.obs;
  final RxBool showPassword = false.obs;
  late final TextEditingController controller;
  late final Function(String, dynamic)? onChanged;
  late final Function(String, dynamic)? onSubmitted;
  late final bool obscureText;
  late String placeholder;
  late final bool emptyOnSubmit;
  final focusNode = FocusNode();
  late final int maxLines;

  InputText({
    super.key,
    String value = "",
    this.obscureText = false,
    this.placeholder = "",
    this.emptyOnSubmit = false,
    this.onChanged,
    this.onSubmitted,
    this.maxLines = 1,
  }) {
    text.value = value;
    showPassword.value = !obscureText;
    controller = TextEditingController(text: text.value);
    controller.addListener(() {
      text.value = controller.text;
      if (onChanged != null) {
        onChanged!(text.value, this);
      }
    });
  }

  /// Sets the value of the text field.
  ///
  /// This method sets the value of the text field both in the `text` observable
  /// and in the `controller`. This ensures that both the GetX state and the
  /// Flutter state of the text field are updated.
  ///
  /// The [value] parameter is the new value to be set for the text field.
  void setValue(String value) {
    text.value = value;
    controller.text = value;
  }

  /// Sets the focus on the input text field.
  void setFocus() {
    focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Obx(
            () => TextField(
              controller: controller,
              focusNode: focusNode,
              maxLines: maxLines,
              onSubmitted: (value) {
                if (onSubmitted != null) {
                  onSubmitted!(value.trim(), this);
                }
              },
              obscureText: !showPassword.value,
              decoration: InputDecoration(hintText: placeholder),
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ),
        if (obscureText)
          IconButton(
            icon: Obx(() => Icon(showPassword.value ? Icons.visibility : Icons.visibility_off)),
            onPressed: () {
              showPassword.value = !showPassword.value;
            },
          ),
      ],
    );
  }
}
