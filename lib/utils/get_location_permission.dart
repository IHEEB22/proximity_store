// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';
//  final geolocator =
//       Geolocator.getCurrentPosition(forceAndroidLocationManager: true);
//   Position _currentPosition;
//   String currentAddress = "";

//   void getCurrentLocation() {
//     Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
//         .then((Position position) {
//       setState(() {
//         _currentPosition = position;
//       });

//       getAddressFromLatLng();
//     }).catchError((e) {
//       print(e);
//     });
//   }

//   void getAddressFromLatLng() async {
//     try {
//       List<Placemark> p = await placemarkFromCoordinates(
//           _currentPosition.latitude, _currentPosition.longitude);

//       Placemark place = p[0];

//       setState(() {
//         currentAddress =
//             "${place.thoroughfare},${place.subThoroughfare},${place.name}, ${place.subLocality}";
//       });
//     } catch (e) {
//       print(e);
//     }
//   }
