import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LineChartScreen(),
    );
  }
}

class LineChartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(2010, 35),
      ChartData(2011, 28),
      ChartData(2012, 34),
      ChartData(2013, 32),
      ChartData(2014, 40),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Line Chart and Steps'),
      ),
      body: Column(
        children: [
          // First half: divided into three parts
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: SfCartesianChart(
                      title: ChartTitle(text: 'Yearly Data'),
                      legend: Legend(isVisible: true),
                      primaryXAxis: NumericAxis(
                        title: AxisTitle(text: 'Year'),
                      ),
                      primaryYAxis: NumericAxis(
                        title: AxisTitle(text: 'Value'),
                      ),
                      series: <CartesianSeries>[
                        LineSeries<ChartData, int>(
                          name: 'Data',
                          dataSource: chartData,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y,
                          markerSettings: MarkerSettings(isVisible: true),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Second half: Home widget
          Expanded(
            flex: 1,
            child: Home(),
          ),
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final double y;
}

class Home extends StatelessWidget {
  final List<int> steps = [1, 2, 3, 4];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF5F5F7),
      child: Center(
        child: Container(
          width: 200.0,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 180.0,
                child: Divider(
                  color: Colors.grey,
                  thickness: 2,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (var step in steps)
                    Icon(
                      Icons.circle,
                      color: step == 1 ? Colors.redAccent[400] : Colors.grey,
                      size: step == 1 ? 24.0 : 16.0,
                    )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
