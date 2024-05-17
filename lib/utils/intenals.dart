List<double> generateStops(int len) {
  final double stop = 1 / len;
  final List<double> stops = List<double>.generate(len, (index) => stop * (index + 1));
  stops[0] = 0;

  return stops;
}
