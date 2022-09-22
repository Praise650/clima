import 'package:geolocator/geolocator.dart';

class Location {
  double? long;
  double? lat;
  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      long = position.longitude;
      lat = position.latitude;
    } catch (e) {
      print(e);
      print(long);
    }
  }
}
