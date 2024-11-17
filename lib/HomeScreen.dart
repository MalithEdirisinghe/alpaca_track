// import 'package:flutter/material.dart';
// import 'AboutDevice.dart'; // Import AboutDevice screen
// import 'GpsTrackingScreen.dart'; // Import GpsTrackingScreen
// import 'HeartRateScreen.dart'; // Import HeartRateScreen
// import 'TempScreen.dart'; // Import TempScreen
// import 'OverviewScreen.dart'; // Import OverviewScreen

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _currentIndex = 0; // Tracks the current selected tab

//   final List<Widget> _screens = [
//     HomeContent(), // Home Screen Content
//     GpsTrackingScreen(), // GPS Tracker Screen
//     HeartRateScreen(), // Heart Rate Screen
//     TempScreen(), // Temp Screen
//     OverviewScreen(), // Overview Screen
//     Center(child: Text('History Screen')), // Replace with History content
//     AboutDeviceScreen(), // AboutDevice screen
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: _screens[_currentIndex], // Dynamically display the selected screen
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         currentIndex: _currentIndex,
//         selectedItemColor: Colors.green,
//         unselectedItemColor: Colors.grey,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index; // Switch between screens
//           });
//         },
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'GPS'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.favorite), label: 'Heart Rate'),
//           BottomNavigationBarItem(icon: Icon(Icons.thermostat), label: 'Temp'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.assessment), label: 'Overview'),
//           BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
//           BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
//         ],
//       ),
//     );
//   }
// }

// class HomeContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(30.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Center(
//             child: RichText(
//               text: const TextSpan(
//                 children: [
//                   TextSpan(
//                     text: 'Alpaca',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 32,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   TextSpan(
//                     text: 'Track',
//                     style: TextStyle(
//                       color: Colors.green,
//                       fontSize: 32,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(height: 20),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'Alpaca ID:  i.e. 12345',
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.grey[800],
//                 ),
//               ),
//               Text(
//                 'Belt ID:  i.e. 00001',
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.grey[800],
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 20),
//           Expanded(
//             child: ListView(
//               children: [
//                 buildOptionButton(
//                   context,
//                   label: '  GPS Tracker',
//                   icon: Icons.location_on,
//                   onTap: () {
//                     final homeScreenState =
//                         context.findAncestorStateOfType<_HomeScreenState>();
//                     homeScreenState?.setState(() {
//                       homeScreenState._currentIndex = 1; // Navigate to GPS
//                     });
//                   },
//                 ),
//                 buildOptionButton(
//                   context,
//                   label: '  Heart Rate',
//                   icon: Icons.favorite,
//                   onTap: () {
//                     final homeScreenState =
//                         context.findAncestorStateOfType<_HomeScreenState>();
//                     homeScreenState?.setState(() {
//                       homeScreenState._currentIndex =
//                           2; // Navigate to Heart Rate
//                     });
//                   },
//                 ),
//                 buildOptionButton(
//                   context,
//                   label: '  Temperature',
//                   icon: Icons.thermostat,
//                   onTap: () {
//                     final homeScreenState =
//                         context.findAncestorStateOfType<_HomeScreenState>();
//                     homeScreenState?.setState(() {
//                       homeScreenState._currentIndex = 3; // Navigate to Temp
//                     });
//                   },
//                 ),
//                 buildOptionButton(
//                   context,
//                   label: '  Overview',
//                   icon: Icons.assessment,
//                   onTap: () {
//                     final homeScreenState =
//                         context.findAncestorStateOfType<_HomeScreenState>();
//                     homeScreenState?.setState(() {
//                       homeScreenState._currentIndex = 4; // Navigate to Overview
//                     });
//                   },
//                 ),
//                 buildOptionButton(
//                   context,
//                   label: '  History',
//                   icon: Icons.history,
//                   onTap: () {
//                     // Navigate to History
//                   },
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             height: 200,
//             child: Image.asset(
//               'assets/images/alpaca_logo.png', // Replace with your asset path
//               fit: BoxFit.contain,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildOptionButton(BuildContext context,
//       {required String label,
//       required IconData icon,
//       required VoidCallback onTap}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: ElevatedButton(
//         onPressed: onTap,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.green[100],
//           padding: EdgeInsets.symmetric(vertical: 16),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//             side: BorderSide(color: Colors.black),
//           ),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Expanded(
//               child: Text(
//                 label,
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             Icon(
//               icon,
//               color: Colors.black,
//               size: 28,
//             ),
//             SizedBox(width: 25),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'AboutDevice.dart'; // Import AboutDevice screen
import 'GpsTrackingScreen.dart'; // Import GpsTrackingScreen
import 'HeartRateScreen.dart'; // Import HeartRateScreen
import 'TempScreen.dart'; // Import TempScreen
import 'OverviewScreen.dart'; // Import OverviewScreen
import 'HistoryScreen.dart'; // Import HistoryScreen

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Tracks the current selected tab

  final List<Widget> _screens = [
    HomeContent(), // Home Screen Content
    GpsTrackingScreen(), // GPS Tracker Screen
    HeartRateScreen(), // Heart Rate Screen
    TempScreen(), // Temp Screen
    OverviewScreen(), // Overview Screen
    HistoryScreen(), // History Screen
    AboutDeviceScreen(), // AboutDevice screen
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_currentIndex], // Dynamically display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Switch between screens
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'GPS'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Heart Rate'),
          BottomNavigationBarItem(icon: Icon(Icons.thermostat), label: 'Temp'),
          BottomNavigationBarItem(
              icon: Icon(Icons.assessment), label: 'Overview'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: RichText(
              text: const TextSpan(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Alpaca ID:  i.e. 12345',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
              Text(
                'Belt ID:  i.e. 00001',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                buildOptionButton(
                  context,
                  label: '  GPS Tracker',
                  icon: Icons.location_on,
                  onTap: () {
                    final homeScreenState =
                        context.findAncestorStateOfType<_HomeScreenState>();
                    homeScreenState?.setState(() {
                      homeScreenState._currentIndex = 1; // Navigate to GPS
                    });
                  },
                ),
                buildOptionButton(
                  context,
                  label: '  Heart Rate',
                  icon: Icons.favorite,
                  onTap: () {
                    final homeScreenState =
                        context.findAncestorStateOfType<_HomeScreenState>();
                    homeScreenState?.setState(() {
                      homeScreenState._currentIndex =
                          2; // Navigate to Heart Rate
                    });
                  },
                ),
                buildOptionButton(
                  context,
                  label: '  Temperature',
                  icon: Icons.thermostat,
                  onTap: () {
                    final homeScreenState =
                        context.findAncestorStateOfType<_HomeScreenState>();
                    homeScreenState?.setState(() {
                      homeScreenState._currentIndex = 3; // Navigate to Temp
                    });
                  },
                ),
                buildOptionButton(
                  context,
                  label: '  Overview',
                  icon: Icons.assessment,
                  onTap: () {
                    final homeScreenState =
                        context.findAncestorStateOfType<_HomeScreenState>();
                    homeScreenState?.setState(() {
                      homeScreenState._currentIndex = 4; // Navigate to Overview
                    });
                  },
                ),
                buildOptionButton(
                  context,
                  label: '  History',
                  icon: Icons.history,
                  onTap: () {
                    final homeScreenState =
                        context.findAncestorStateOfType<_HomeScreenState>();
                    homeScreenState?.setState(() {
                      homeScreenState._currentIndex = 5; // Navigate to History
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            height: 200,
            child: Image.asset(
              'assets/images/alpaca_logo.png', // Replace with your asset path
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOptionButton(BuildContext context,
      {required String label,
      required IconData icon,
      required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green[100],
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.black),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Icon(
              icon,
              color: Colors.black,
              size: 28,
            ),
            SizedBox(width: 25),
          ],
        ),
      ),
    );
  }
}
