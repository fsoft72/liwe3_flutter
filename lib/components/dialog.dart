import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'button.dart';
import '../stores/theme.dart';

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

  return Get.dialog(
    AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5), // Adjust border radius here
      ),
      title: Text(title),
      content: Text(content),
      actions: [
        ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            Button(label: cancelLabel, mode: LiWETheme.error, onClick: (_) => close(cancel, false)),
            Button(label: confirmLabel, mode: LiWETheme.success, onClick: (_) => close(confirm, true)),
          ],
        ),
      ],
    ),
  );
}

Future<dynamic> alertDialog({
  String title = 'Alert',
  String content = 'Alert message',
  Function? confirm,
}) async {
  return Get.dialog(
    AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5), // Adjust border radius here
      ),
      title: Text(title),
      content: Text(content),
      actions: [
        Button(
          label: "OK",
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
    ),
  );
}
