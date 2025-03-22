import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'button.dart';

Future<dynamic> _createDialog({
  required String title,
  required String content,
  required List<Widget> actions,
}) {
  return Get.dialog(
    AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5), // Adjust border radius here
      ),
      title: Text(title),
      content: Text(content),
      actions: [
        OverflowBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: actions,
        ),
      ],
    ),
    barrierDismissible: false,
  );
}

Future<dynamic> confirmDialog({
  String title = 'Confirm',
  String content = 'Are you sure?',
  Function? confirm,
  Function? cancel,
  String confirmLabel = 'Yes',
  String cancelLabel = 'No',
}) async {
  void close(cback, result) {
    Get.back(result: result);
    if (cback != null) cback();
  }

  return _createDialog(
    title: title,
    content: content,
    actions: [
      Button(
        label: cancelLabel,
        backgroundColor: Colors.red,
        color: Colors.white,
        borderRadius: 10,
        borderColor: Colors.black,
        onClick: (_) => close(cancel, false),
      ),
      Button(
        label: confirmLabel,
        backgroundColor: Colors.green,
        color: Colors.white,
        borderRadius: 10,
        borderColor: Colors.black,
        onClick: (_) => close(confirm, true),
      ),
    ],
  );
}

Future<dynamic> alertDialog({
  String title = 'Alert',
  String content = 'Alert message',
  Function? confirm,
}) async {
  return _createDialog(
    title: title,
    content: content,
    actions: [
      Button(
        label: 'OK',
        backgroundColor: Colors.red,
        color: Colors.white,
        borderRadius: 10,
        borderColor: Colors.black,
        onClick: (_) {
          Get.back(result: true);
          if (confirm != null) confirm();
        },
      ),
    ],
  );
}
