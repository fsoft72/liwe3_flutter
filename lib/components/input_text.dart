// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

enum InputType { text, email, phone, password, number, url }

class InputText extends StatelessWidget {
  final RxString text = ''.obs;
  final RxBool showPassword = false.obs;
  late final TextEditingController controller;
  late final Function(String, dynamic)? onChange;
  late final Function(String, dynamic)? onSubmit;
  bool obscureText;
  late String placeholder;
  late final bool emptyOnSubmit;
  final focusNode = FocusNode();
  late final int maxLines;
  late String validChars;
  late final InputType type;
  final Icon? prefixIcon;
  final Icon? suffixIcon;

  Color? color;
  Color? placeholderColor;
  TextAlign textAlign;
  double? fontSize;
  String? label;
  bool showBorder = true;
  Color? borderColor;

  TextInputType keyboardType = TextInputType.text;

  InputText({
    super.key,
    String value = "",
    this.obscureText = false,
    this.placeholder = "",
    this.validChars = '',
    this.type = InputType.text,
    this.emptyOnSubmit = false,
    this.onChange,
    this.onSubmit,
    this.maxLines = 1,
    this.prefixIcon,
    this.suffixIcon,
    this.color,
    this.placeholderColor,
    this.textAlign = TextAlign.left,
    this.fontSize,
    this.label,
    this.showBorder = true,
    this.borderColor,
  }) {
    text.value = value;
    controller = TextEditingController(text: text.value);
    controller.addListener(() {
      text.value = controller.text;
      if (onChange != null) {
        onChange!(text.value, this);
      }
    });

    if (type == InputType.email) {
      validChars = 'a-zA-Z0-9@._-';
      keyboardType = TextInputType.emailAddress;
    } else if (type == InputType.password) {
      validChars = '';
      obscureText = true;
    } else if (type == InputType.number) {
      validChars = '0-9';
      keyboardType = TextInputType.number;
    } else if (type == InputType.phone) {
      validChars = '0-9+';
      keyboardType = TextInputType.phone;
    } else if (type == InputType.url) {
      validChars = 'a-zA-Z0-9@._-:/';
      keyboardType = TextInputType.url;
    } else {
      keyboardType = TextInputType.text;
    }

    showPassword.value = !obscureText;

    if (validChars.isEmpty) {
      validChars = '.*';
    } else {
      validChars = '[$validChars]';
    }
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

  /// Returns the value of the text field.
  String getValue() {
    return text.value;
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
                if (onSubmit != null) {
                  onSubmit!(value.trim(), this);
                }
              },
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(validChars)),
              ],
              keyboardType: keyboardType,
              obscureText: !showPassword.value,
              decoration: InputDecoration(
                labelText: label,
                hintText: placeholder,
                hintStyle: TextStyle(color: placeholderColor),
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                border: showBorder
                    ? OutlineInputBorder(borderSide: BorderSide(color: borderColor ?? Colors.black))
                    : InputBorder.none,
              ),
              style: TextStyle(
                fontSize: fontSize,
                color: color,
              ),
              textAlign: textAlign,
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
