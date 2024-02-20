String currencyFormat (double number, {String thousandSeparator = '.', String decimalSeparator = ','}) {
  final buffer = StringBuffer();
  final parts = number.toStringAsFixed(2).split('.');
  final integerPart = parts[0];
  final decimalPart = parts[1];

  for (int i = 0; i < integerPart.length; i++) {
    if (i > 0 && (integerPart.length - i) % 3 == 0) {
      buffer.write(thousandSeparator);
    }
    buffer.write(integerPart[i]);
  }

  buffer.write(decimalSeparator);
  buffer.write(decimalPart);

  return buffer.toString();
}
