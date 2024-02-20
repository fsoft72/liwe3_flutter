import 'package:flutter/foundation.dart';

const bool inTest = kDebugMode;

void zprint(String message) {
  if (!inTest) return;
  // ignore: avoid_print
  print(message);
}
