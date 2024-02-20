// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputText extends StatelessWidget {
  final RxString text = ''.obs;
  final RxBool showPassword = false.obs;
  late final TextEditingController textEditingController;
  late final Function(String)? onChanged;
  late final bool obscureText;
  late String placeholder;

  InputText({
    super.key,
    required String value,
    this.obscureText = false,
    this.onChanged,
    this.placeholder = "",
  }) {
    text.value = value;
    showPassword.value = !obscureText;
    textEditingController = TextEditingController(text: text.value);
    textEditingController.addListener(() {
      text.value = textEditingController.text;
      if (onChanged != null) {
        onChanged!(text.value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Obx(
            () => TextField(
              controller: textEditingController,
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
