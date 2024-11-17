import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:async';
import 'dart:math';

class HeartRateScreen extends StatefulWidget {
  @override
  _HeartRateScreenState createState() => _HeartRateScreenState();
}

class _HeartRateScreenState extends State<HeartRateScreen> {
  List<GraphData> _data = [];
  late Timer _timer;
  int _timeCounter = 5800;
  late String _currentDateTime; // Variable to store the current date and time

  @override
  void initState() {
    super.initState();
    _currentDateTime = _formatDateTime(
        DateTime.now()); // Initialize with current date and time
    _updateCurrentDateTime(); // Start periodic updates
    _generateMockData();
    _startUpdatingGraph();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  // Update the current date and time every minute
  void _updateCurrentDateTime() {
    Timer.periodic(Duration(minutes: 1), (timer) {
      setState(() {
        _currentDateTime = _formatDateTime(DateTime.now());
      });
    });
  }

  // Format the date and time as "dd/MM/yyyy hh:mm"
  String _formatDateTime(DateTime dateTime) {
    return "${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year} ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
  }

  void _generateMockData() {
    final Random random = Random();
    _data = List.generate(
      50,
      (index) =>
          GraphData(_timeCounter + (index * 20), random.nextInt(1000) - 500),
    );
  }

  void _startUpdatingGraph() {
    final Random random = Random();
    _timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        _data.removeAt(0);
        _timeCounter += 20;
        _data.add(GraphData(_timeCounter, random.nextInt(1000) - 500));
      });
    });
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
            SizedBox(height: 10),
            Text(
              'Heart Rate',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            // Alpaca and Belt IDs
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Alpaca ID:  i.e. 12345',
                  style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                ),
                Text(
                  'Belt ID:  i.e. 00001',
                  style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Graph Display
            Expanded(
              child: SfCartesianChart(
                primaryXAxis: NumericAxis(
                  title: AxisTitle(text: 'Time (sec)'),
                ),
                primaryYAxis: NumericAxis(
                  title: AxisTitle(text: 'PPG Data'),
                ),
                series: <LineSeries<GraphData, int>>[
                  LineSeries<GraphData, int>(
                    dataSource: _data,
                    xValueMapper: (GraphData data, _) => data.time,
                    yValueMapper: (GraphData data, _) => data.value,
                  )
                ],
              ),
            ),
            // Graph note
            Text(
              'Note: this graph should show the real-time data collected from the PPG sensor',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            SizedBox(height: 10),
            // Heart rate details
            Text(
              'Date/ Time:   $_currentDateTime',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'Resting Heart Rate:  60 – 90 bpm',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'Beats Per Minute (BPM):  74 bpm',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class GraphData {
  final int time;
  final int value;

  GraphData(this.time, this.value);
}
