import 'package:location/location.dart';
import 'mapmodel.dart';
import 'dart:async';

class LocationService {
  Userlocation _currentlocation;
  Location location = Location();
  StreamController<Userlocation> _locationController =
      StreamController<Userlocation>();
  LocationService() {
    location.requestPermission().then((granted) {
      if (granted != null) {
        location.onLocationChanged.listen((locationData) {
          if (locationData != null) {
            _locationController.add(Userlocation(
                latitude: locationData.latitude,
                longitude: locationData.longitude));
          }
        });
      }
    });
  }
  Stream<Userlocation> get locationStream => _locationController.stream;
  Future<Userlocation> getLocation() async {
    try {
      var userLocation = await location.getLocation();
      _currentlocation = Userlocation(
          latitude: userLocation.latitude, longitude: userLocation.longitude);
      return _currentlocation;
    } catch (e) {
      print('error');
    }
  }
}
