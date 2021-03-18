import 'dart:math' show cos, sqrt, asin;

void main() {
  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  var totalDistance =
      calculateDistance(26.196435, 78.197535, 26.197195, 78.196408);

  print(totalDistance);
}
