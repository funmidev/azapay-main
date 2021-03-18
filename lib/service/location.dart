import 'dart:math' show sin, cos, sqrt, atan2;

import 'package:geolocator/geolocator.dart';
import 'package:vector_math/vector_math.dart';

class Location {
  Location({this.latitude, this.longitude});
  double latitude, longitude;
  double earthRadius;

//Using pLat and pLng as dummy location
  double agent_Lat;
  double agent_Long;

  Future<void> getCurrentLocation() async {
    try {
      var position = await Geolocator
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }

  ///
  ///
  /// -----------Calculate the distance between user Location-----------------------
  ///
  ///

  void getDistance() {
    var dLat = radians(agent_Lat - latitude);
    var dLng = radians(agent_Long - longitude);
    var a = sin(dLat / 2) * sin(dLat / 2) +
        cos(radians(latitude)) *
            cos(radians(agent_Lat)) *
            sin(dLng / 2) *
            sin(dLng / 2);
    var c = 2 * atan2(sqrt(a), sqrt(1 - a));
    var d = earthRadius * c;
    print(d); //d is the distance in meters
  }
}
