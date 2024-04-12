int toInt(String value) {
  try {
    return int.parse(value);
  } catch (e) {
    return 0;
  }
}

double toDouble(String value) {
  try {
    return double.parse(value);
  } catch (e) {
    return 0.0;
  }
}

String toString(dynamic value) {
  try {
    return value.toString();
  } catch (e) {
    return '';
  }
}
