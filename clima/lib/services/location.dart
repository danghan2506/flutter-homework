import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();

        if (permission == LocationPermission.deniedForever) {
          print("Permission denied forever");
          return;
        }

        if (permission == LocationPermission.denied) {
          print("Permission denied");
          return;
        }
      }

      Position position = await Geolocator.getCurrentPosition(
        locationSettings:
            const LocationSettings(accuracy: LocationAccuracy.low),
      );

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print("Error getting location: $e");
    }
  }
}
