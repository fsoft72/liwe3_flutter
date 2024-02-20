import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        TextButton(
          child: const Text('No'),
          onPressed: () => close(cancel, false),
        ),
        TextButton(
          child: const Text('Yes', style: TextStyle(color: Colors.white)),
          onPressed: () => close(confirm, true),
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
        TextButton(
          child: const Text('OK', style: TextStyle(color: Colors.white)),
          onPressed: () {
            Get.back();
            if (confirm != null) confirm();
          },
        ),
      ],
    ),
  );
}
