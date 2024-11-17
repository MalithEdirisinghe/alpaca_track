import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:async';
import 'dart:math';

class TempScreen extends StatefulWidget {
  @override
  _TempScreenState createState() => _TempScreenState();
}

class _TempScreenState extends State<TempScreen> {
  List<GraphData> _data = [];
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _generateMockData();
    _startUpdatingGraph();
    _updateCurrentDateTime();
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
      20,
      (index) => GraphData(
          time: DateTime.now().add(Duration(minutes: -index * 5)),
          value: 36.5 + random.nextDouble() * 1.5),
    ).reversed.toList(); // Reverse to make the latest data on the right
  }

  void _startUpdatingGraph() {
    final Random random = Random();
    _timer = Timer.periodic(Duration(seconds: 30), (timer) {
      setState(() {
        _data.removeAt(0);
        _data.add(
          GraphData(
            time: DateTime.now(),
            value: 36.5 + random.nextDouble() * 1.5,
          ),
        );
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
            // Title
            Text(
              'Temperature',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
                backgroundColor: Colors.blue[100],
              ),
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
                title: ChartTitle(text: 'Body Temperature'),
                primaryXAxis: DateTimeAxis(
                  title: AxisTitle(text: 'Time'),
                  dateFormat: DateFormat('hh:mm a'),
                ),
                primaryYAxis: NumericAxis(
                  title: AxisTitle(text: 'Temperature (°C)'),
                  minimum: 36.0,
                  maximum: 38.5,
                ),
                series: <LineSeries<GraphData, DateTime>>[
                  LineSeries<GraphData, DateTime>(
                    dataSource: _data,
                    xValueMapper: (GraphData data, _) => data.time,
                    yValueMapper: (GraphData data, _) => data.value,
                    markerSettings: MarkerSettings(isVisible: true),
                  )
                ],
              ),
            ),
            // Graph note
            Text(
              'Note: this graph should show the real-time data collected from temperature sensor',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class GraphData {
  final DateTime time;
  final double value;

  GraphData({required this.time, required this.value});
}
