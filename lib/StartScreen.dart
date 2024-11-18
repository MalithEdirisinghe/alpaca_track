import 'package:alpaca_track/AboutDevice.dart';
import 'package:flutter/material.dart';
// Import the AboutDevice screen

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Alpaca illustration placeholder
              Container(
                height: 200,
                child: Image.asset(
                  'assets/images/alpaca.png', // Replace with your image asset path
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 20),
              // Title
              RichText(
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
              SizedBox(height: 10),
              // Subtitle
              Text(
                'Track your Alpacas’ vitals & locations',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 40),
              // Track button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutDeviceScreen(),
                    ), // Navigate to AboutDevice screen
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 19, 124, 23),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 85, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Track',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
