import 'package:flutter/material.dart';
import 'HomeScreen.dart'; // Import HomeScreen

class AboutDeviceScreen extends StatelessWidget {
  final TextEditingController _alpacaIdController = TextEditingController();

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
            // Search bar
            TextField(
              controller: _alpacaIdController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                hintText: 'Enter alpaca ID (i.e. 12345)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            // Search button
            ElevatedButton(
              onPressed: () {
                String alpacaId = _alpacaIdController.text;
                if (alpacaId.length == 5 && int.tryParse(alpacaId) != null) {
                  // Navigate to HomeScreen and pass Alpaca ID
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(
                        alpacaId: alpacaId, // Pass Alpaca ID to HomeScreen
                      ),
                    ),
                  );
                } else {
                  // Show an error dialog
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Invalid ID'),
                      content: Text('Please enter a valid 5-digit Alpaca ID.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text('Search'),
            ),
            SizedBox(height: 20),
            // About the device title
            Center(
              child: Text(
                'About the Device:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
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
    );
  }
}
