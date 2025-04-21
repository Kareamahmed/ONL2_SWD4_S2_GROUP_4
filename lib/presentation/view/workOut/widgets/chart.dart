import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawHorizontalLine: true,
          horizontalInterval: 20,
          getDrawingHorizontalLine: (value) => FlLine(
            color: Colors.white.withOpacity(0.2),
            strokeWidth: 1,
          ),
          drawVerticalLine: false, // Hide vertical lines
        ),
        borderData: FlBorderData(
          show: true,
          border: Border(),
        ),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                const style = TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                );
                switch (value.toInt()) {
                  case 0:
                    return Text('Sun', style: style);
                  case 1:
                    return Text('Mon', style: style);
                  case 2:
                    return Text('Tue', style: style);
                  case 3:
                    return Text('Wed', style: style);
                  case 4:
                    return Text('Thu', style: style);
                  case 5:
                    return Text('Fri', style: style);
                  case 6:
                    return Text('Sat', style: style);
                }
                return const SizedBox.shrink();
              },
            ),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 20,
              getTitlesWidget: (value, meta) {
                return Text(
                  value.toInt().toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                );
              },
            ),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        minX: 0,
        maxX: 6,
        minY: 0,
        maxY: 100,
        lineBarsData: [
          LineChartBarData(
            spots: [
              //this is the weekdays
              FlSpot(0, 30),
              FlSpot(1, 50),
              FlSpot(2, 20),
              FlSpot(3, 80),
              FlSpot(4, 40),
              FlSpot(5, 90),
              FlSpot(6, 60),
            ],
            isCurved: true,
            color: Colors.white,
            barWidth: 2,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) {
                if (index == 5) {
                  // Only Friday
                  return FlDotCirclePainter(
                    radius: 6,
                    color: Colors.white,
                    strokeWidth: 3,
                    strokeColor: Colors.transparent,
                  );
                } else {
                  return FlDotCirclePainter(
                    radius: 0,
                    color: Colors.transparent,
                  );
                }
              },
            ),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [
                  Colors.white
                      .withValues(red: 0.5, green: .5, blue: .5, alpha: 0.0),
                  Colors.transparent,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
