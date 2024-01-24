// import 'package:flutter/material.dart';
// import 'package:location/location.dart';

// class MapProvider extends ChangeNotifier {
//   LocationData? _currentLocation;

//   LocationData? get currentLocation => _currentLocation;

//   Future<void> updateLocation() async {
//     Location location = Location();
//     _currentLocation = await location.getLocation();
//     notifyListeners();
//   }

//   void shareLocation() {
//     if (_currentLocation != null) {
//       final latitude = _currentLocation!.latitude;
//       final longitude = _currentLocation!.longitude;
//       final message =
//           "Check out my location: https://maps.google.com/?q=$latitude,$longitude";
//       // Share.share(message);
//     } else {
//       print("Location not available");
//     }
//   }
// }
