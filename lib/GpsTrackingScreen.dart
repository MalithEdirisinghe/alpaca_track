// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class GpsTrackingScreen extends StatefulWidget {
//   final String alpacaId; // Accept Alpaca ID

//   GpsTrackingScreen({required this.alpacaId});

//   @override
//   _GpsTrackingScreenState createState() => _GpsTrackingScreenState();
// }

// class _GpsTrackingScreenState extends State<GpsTrackingScreen> {
//   late GoogleMapController _mapController;

//   // Initial camera position (Set to your desired location)
//   static const CameraPosition _initialPosition = CameraPosition(
//     target: LatLng(-33.8688, 151.2093), // Example: Sydney, Australia
//     zoom: 12,
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.all(30.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // App title
//             Center(
//               child: RichText(
//                 textAlign: TextAlign.center,
//                 text: TextSpan(
//                   children: [
//                     TextSpan(
//                       text: 'Alpaca',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 32,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     TextSpan(
//                       text: 'Track',
//                       style: TextStyle(
//                         color: Colors.green,
//                         fontSize: 32,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             // Location text aligned to the left
//             Text(
//               'Location',
//               style: TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//               textAlign: TextAlign.left,
//             ),
//             SizedBox(height: 20),
//             // Alpaca ID and Belt ID with bold label and grey value
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text.rich(
//                   TextSpan(
//                     children: [
//                       TextSpan(
//                         text: 'Alpaca ID: ',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                       ),
//                       TextSpan(
//                         text: '${widget.alpacaId}',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: const Color.fromARGB(255, 163, 162, 162),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Text.rich(
//                   TextSpan(
//                     children: [
//                       TextSpan(
//                         text: 'Belt ID: ',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                       ),
//                       TextSpan(
//                         text: 'i.e. 00001',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: const Color.fromARGB(255, 163, 162, 162),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             // Google Map
//             Expanded(
//               child: GoogleMap(
//                 initialCameraPosition: _initialPosition,
//                 onMapCreated: (GoogleMapController controller) {
//                   _mapController = controller;
//                 },
//                 markers: {
//                   Marker(
//                     markerId: MarkerId('alpaca_location'),
//                     position: LatLng(-33.8688, 151.2093), // Set marker position
//                     infoWindow: InfoWindow(title: 'Alpaca Location'),
//                   ),
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GpsTrackingScreen extends StatefulWidget {
  final String alpacaId; // Accept Alpaca ID

  GpsTrackingScreen({required this.alpacaId});

  @override
  _GpsTrackingScreenState createState() => _GpsTrackingScreenState();
}

class _GpsTrackingScreenState extends State<GpsTrackingScreen> {
  late GoogleMapController _mapController;
  Location _location = Location();
  LatLng? _currentLocation;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  // Get user location
  Future<void> _getUserLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    // Check if location services are enabled
    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) return;
    }

    // Check for location permissions
    permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) return;
    }

    // Get the user's current location
    final userLocation = await _location.getLocation();
    setState(() {
      _currentLocation = LatLng(userLocation.latitude!, userLocation.longitude!);
    });

    // Move the map to the user's location
    if (_mapController != null) {
      _mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: _currentLocation!, zoom: 15),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // App title
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Alpaca',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'Track',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Location text aligned to the left
            Text(
              'Location',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 20),
            // Alpaca ID and Belt ID with bold label and grey value
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Alpaca ID: ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: '${widget.alpacaId}',
                        style: TextStyle(
                          fontSize: 16,
                          color: const Color.fromARGB(255, 163, 162, 162),
                        ),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Belt ID: ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'i.e. 00001',
                        style: TextStyle(
                          fontSize: 16,
                          color: const Color.fromARGB(255, 163, 162, 162),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Google Map
            Expanded(
              child: _currentLocation == null
                  ? Center(child: CircularProgressIndicator())
                  : GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: _currentLocation!,
                        zoom: 15,
                      ),
                      onMapCreated: (GoogleMapController controller) {
                        _mapController = controller;
                      },
                      markers: {
                        Marker(
                          markerId: MarkerId('alpaca_location'),
                          position: _currentLocation!, // Set marker position
                          infoWindow: InfoWindow(title: 'Alpaca Location'),
                        ),
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
