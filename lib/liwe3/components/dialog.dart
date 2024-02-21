import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liwe3_flutter/liwe3/components/button.dart';
import 'package:liwe3_flutter/liwe3/stores/theme.dart';

void confirmDialog({
  String title = 'Confirm',
  String content = 'Are you sure?',
  Function? confirm,
  Function? cancel,
}) {
  void close(cback, result) {
    Get.back(result: result);
    if (cback != null) cback();
  }

  Get.dialog(
    AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5), // Adjust border radius here
      ),
      title: Text(title),
      content: Text(content),
      actions: [
        Button(label: 'No', mode: LiWETheme.error, onClick: (_) => close(cancel, false)),
        Button(label: 'Yes', mode: LiWETheme.success, onClick: (_) => close(confirm, true)),
      ],
    ),
  );
}

void alertDialog({
  String title = 'Alert',
  String content = 'Alert message',
  Function? confirm,
}) {
  Get.dialog(
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
            Get.back();
            if (confirm != null) confirm();
          },
        ),
      ],
    ),
  );
}
