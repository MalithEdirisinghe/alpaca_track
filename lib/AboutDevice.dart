import 'package:flutter/material.dart';

class AboutDeviceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // App title
            RichText(
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
            SizedBox(height: 20),
            // Search bar
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                hintText: 'Enter alpaca ID (i.e. 12345)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 20),
            // About the device title
            Text(
              'About the device:',
              textAlign: TextAlign.center, // Align the text in the center
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),

            // Image of the collar
            Center(
              child: Image.asset(
                'assets/images/collar.png', // Replace with your asset path
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 20),
            // Description text
            Text(
              'Our innovative alpaca tracking collar offers a rugged, reliable solution '
              'for long-term monitoring in remote, challenging environments like the southern '
              'Peruvian highlands. Built with durable, weather-resistant materials, this advanced '
              'collar is tailored to track and monitor critical data on alpacas in their natural habitat '
              'without impacting their comfort.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
            ),
            SizedBox(height: 20),
            Text(
              'The collar features an integrated sensor pack, including heart rate (ECG or PPG), '
              'GPS, and heat monitoring sensors to track the animal\'s health, location, and '
              'surrounding environment. Strategically placed on the neck, the sensors gather '
              'precise data while kinetic batteries harness the alpaca’s movement to sustainably '
              'power the device, ensuring autonomous, off-grid functionality. A separate battery '
              'compartment simplifies maintenance, securing sensors and wiring from wear and '
              'tangling.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
        ],
      ),
    );
  }
}
