import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:suivivital/view/user/log2/Chart/chart.dart';

class LineChartWidget extends StatelessWidget {
  final List<Point> points;
  const LineChartWidget(this.points, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: LineChart(LineChartData(lineBarsData: [
        LineChartBarData(
            spots: points.map((point) => FlSpot(point.x, point.y)).toList(),
            isCurved: false,
            dotData: FlDotData(show: true))
      ])),
    );
  }
}
