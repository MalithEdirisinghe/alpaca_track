import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:table_calendar/table_calendar.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  DateTime _focusedDay = DateTime.now(); // Tracks the currently focused day
  DateTime? _selectedDay; // Tracks the selected day

  @override
  Widget build(BuildContext context) {
    // Mock data for Heart Rate and Temperature
    final List<GraphData> heartRateData = List.generate(50,
        (index) => GraphData(index * 20, (500 * (index % 2 == 0 ? 1 : -1))));
    final List<GraphData> temperatureData = List.generate(
        10, (index) => GraphData(index, 37 + (index % 2 == 0 ? 1 : 0.5)));

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
            SizedBox(height: 10),
            // Title
            Text(
              'History',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
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
            SizedBox(height: 20),
            // Calendar
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              calendarFormat: CalendarFormat.month,
              headerStyle: HeaderStyle(
                formatButtonVisible: false, // Hide the format button
                titleCentered: true,
              ),
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.green[200],
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Heart Rate Average Graph
            Text(
              'Heart Rate Average:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 250, // Fixed height for the graph
              child: SfCartesianChart(
                primaryXAxis: NumericAxis(title: AxisTitle(text: 'Time (sec)')),
                primaryYAxis: NumericAxis(title: AxisTitle(text: 'PPG Data')),
                series: <LineSeries<GraphData, int>>[
                  LineSeries<GraphData, int>(
                    dataSource: heartRateData,
                    xValueMapper: (GraphData data, _) => data.time,
                    yValueMapper: (GraphData data, _) => data.value,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Temperature Average Graph
            Text(
              'Temperature Average:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 250, // Fixed height for the graph
              child: SfCartesianChart(
                primaryXAxis:
                    NumericAxis(title: AxisTitle(text: 'Time (Days)')),
                primaryYAxis:
                    NumericAxis(title: AxisTitle(text: 'Temperature (°C)')),
                series: <LineSeries<GraphData, int>>[
                  LineSeries<GraphData, int>(
                    dataSource: temperatureData,
                    xValueMapper: (GraphData data, _) => data.time,
                    yValueMapper: (GraphData data, _) => data.value,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GraphData {
  final int time;
  final double value;

  GraphData(this.time, this.value);
}
