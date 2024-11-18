import 'package:flutter/material.dart';
import 'GpsTrackingScreen.dart';
import 'HeartRateScreen.dart';
import 'TempScreen.dart';
import 'OverviewScreen.dart';
import 'HistoryScreen.dart';

class HomeScreen extends StatefulWidget {
  final String alpacaId; // Alpaca ID passed to the screen

  HomeScreen({required this.alpacaId});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    // Initialize screens with the passed alpacaId
    _screens = [
      HomeContent(alpacaId: widget.alpacaId),
      GpsTrackingScreen(alpacaId: widget.alpacaId),
      HeartRateScreen(alpacaId: widget.alpacaId),
      TempScreen(alpacaId: widget.alpacaId),
      OverviewScreen(alpacaId: widget.alpacaId),
      HistoryScreen(alpacaId: widget.alpacaId),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Change screen on tap
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'GPS'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Heart'),
          BottomNavigationBarItem(icon: Icon(Icons.thermostat), label: 'Temp'),
          BottomNavigationBarItem(
              icon: Icon(Icons.assessment), label: 'Overview'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  final String alpacaId;

  HomeContent({required this.alpacaId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // App title
          Center(
            child: RichText(
              textAlign: TextAlign.center,
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
          const SizedBox(height: 20),
          // Alpaca and Belt IDs
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
                      text: '$alpacaId',
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

          const SizedBox(height: 20),
          // Navigation options
          Expanded(
            child: ListView(
              children: [
                buildOptionButton(
                  context,
                  label: '  GPS Tracker',
                  icon: Icons.location_on,
                  index: 1,
                ),
                buildOptionButton(
                  context,
                  label: '  Heart Rate',
                  icon: Icons.favorite,
                  index: 2,
                ),
                buildOptionButton(
                  context,
                  label: '  Temperature',
                  icon: Icons.thermostat,
                  index: 3,
                ),
                buildOptionButton(
                  context,
                  label: '  Overview',
                  icon: Icons.assessment,
                  index: 4,
                ),
                buildOptionButton(
                  context,
                  label: '  History',
                  icon: Icons.history,
                  index: 5,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Logo image
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
      {required String label, required IconData icon, required int index}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {
          final homeScreenState =
              context.findAncestorStateOfType<_HomeScreenState>();
          // ignore: invalid_use_of_protected_member
          homeScreenState?.setState(() {
            homeScreenState._currentIndex = index; // Navigate to selected index
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green[100],
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.black),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
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
            const SizedBox(width: 25),
          ],
        ),
      ),
    );
  }
}
