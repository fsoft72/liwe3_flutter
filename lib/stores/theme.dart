import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum LiWETheme { info, warn, success, error }

class ThemeStore extends GetxController {
  // Define the theme settings
  var variants = {
    LiWETheme.info: {
      "backgroundColor": Colors.blue,
      "color": Colors.white,
      "borderColor": Colors.blue[900],
    },
    LiWETheme.warn: {
      "backgroundColor": Colors.yellow,
      "color": Colors.black,
      "borderColor": Colors.yellow[900],
    },
    LiWETheme.success: {
      "backgroundColor": Colors.green,
      "color": Colors.white,
      "borderColor": Colors.green[900],
    },
    LiWETheme.error: {
      "backgroundColor": Colors.red,
      "color": Colors.white,
      "borderColor": Colors.red[900],
    },
  }.obs;

  var borderRadius = 10.0.obs;
  var borderColor = Colors.black.obs;

  void setVariant(LiWETheme name, Color backgroundColor, Color color, Color borderColor) {
    var theme = variants[name];
    if (theme != null) {
      theme["backgroundColor"] = backgroundColor;
      theme["color"] = color;
      theme["borderColor"] = borderColor;
    }
  }

  Map<String, Color?> getVariant(LiWETheme name) {
    return variants[name]!;
  }

  void setBorderRadius(double radius) {
    borderRadius.value = radius;
  }

  void setBorderColor(Color color) {
    borderColor.value = color;
  }
}

final ThemeStore theme = ThemeStore();
