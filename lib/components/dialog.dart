import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'button.dart';
import '../stores/theme.dart';

void confirmDialog({
  String title = 'Confirm',
  String content = 'Are you sure?',
  Function? confirm,
  Function? cancel,
  String confirmLabel = 'Yes',
  String cancelLabel = 'No',
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
        Expanded(
          child: Row(
            children: [
              Button(label: cancelLabel, mode: LiWETheme.error, onClick: (_) => close(cancel, false)),
              const Spacer(),
              Button(label: confirmLabel, mode: LiWETheme.success, onClick: (_) => close(confirm, true)),
            ],
          ),
        ),
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
