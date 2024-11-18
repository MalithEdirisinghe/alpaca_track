import 'package:flutter/material.dart';

class GpsTrackingScreen extends StatelessWidget {
  final String alpacaId; // Accept Alpaca ID

  GpsTrackingScreen({required this.alpacaId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // Align content to stretch
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
            SizedBox(height: 20), // Spacing after the title
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
            // Mock map display
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/images/mock_map.png', // Replace with your mock map image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
