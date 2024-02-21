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

  InputText({
    super.key,
    required String value,
    this.obscureText = false,
    this.onChanged,
    this.onSubmitted,
    this.placeholder = "",
    this.emptyOnSubmit = false,
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

  void setValue(String value) {
    text.value = value;
    controller.text = value;
  }

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
