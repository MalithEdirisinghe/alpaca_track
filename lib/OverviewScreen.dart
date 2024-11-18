import 'package:flutter/material.dart';

class OverviewScreen extends StatelessWidget {
  final String alpacaId; // Accept Alpaca ID

  OverviewScreen({required this.alpacaId});

  @override
  Widget build(BuildContext context) {
    // Mock data for bpm and temperature
    final heartRateAverage = "75 bpm";
    final temperatureAverage = "37.2 °C";

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
            SizedBox(height: 10),
            // Title
            Text(
              'Overview',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 10),
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
            SizedBox(height: 50),
            // Details
            Row(
              children: [
                Text(
                  'Date:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  DateTime.now().toString().substring(0, 10),
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Alpaca ID:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  alpacaId, // Dynamically display Alpaca ID
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Collar ID:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'i.e. 00001',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Heart Rate Average (bpm):',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  heartRateAverage,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Temperature Average (°C):',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  temperatureAverage,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Spacer(),
            // Alpaca image
            Center(
              child: Image.asset(
                'assets/images/overview.png', // Replace with your asset path
                height: 250,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
