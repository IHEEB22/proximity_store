// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class GoogleMapCard extends StatefulWidget {
//   @override
//   _GoogleMapCardState createState() => _GoogleMapCardState();
// }

// class _GoogleMapCardState extends State<GoogleMapCard> {
//   GoogleMapController? mapController; //contrller for Google map
//   Set<Marker> markers = Set(); //markers for google map
//   LatLng showLocation = LatLng(27.7089427, 85.3086209);
//   //location to show in map

//   @override
//   void initState() {
//     markers.add(Marker(
//       //add marker on google map
//       markerId: MarkerId(showLocation.toString()),
//       position: showLocation, //position of marker
//       infoWindow: InfoWindow(
//         //popup info
//         title: 'My Custom Title ',
//         snippet: 'My Custom Subtitle',
//       ),
//       icon: BitmapDescriptor.defaultMarker, //Icon for Marker
//     ));

//     //you can add more markers here
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GoogleMap(
//       //Map widget from google_maps_flutter package
//       zoomGesturesEnabled: true, //enable Zoom in, out on map
//       initialCameraPosition: CameraPosition(
//         //innital position in map
//         target: showLocation, //initial position
//         zoom: 10.0, //initial zoom level
//       ),
//       markers: markers, //markers to show on map
//       mapType: MapType.normal, //map type
//       onMapCreated: (controller) {
//         //method called when map is created
//         setState(() {
//           mapController = controller;
//         });
//       },
//     );
//   }
// }
