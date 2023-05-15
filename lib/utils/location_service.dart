import 'dart:developer';

import 'package:geolocator/geolocator.dart';

class LocationService {
  late Position _currentPosition;

  Future<void> getCurrentLocation() async {
    try {
      _currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    } catch (e) {
      inspect(e);
    }
  }

  double getLatitude() {
    return _currentPosition.latitude;
  }

  double getLongitude() {
    return _currentPosition.longitude;
  }
}
