import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import '../providers/home_data_provider.dart';

class ProgramStatusMetricsChart extends ConsumerWidget {
  final double height;
  const ProgramStatusMetricsChart({super.key, required this.height});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(programStatusMetricsProvider);
    final barWidth = 7.0;

    return SizedBox(
      height: height,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        margin: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Program Status Metrics",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  DropdownButton<String>(
                    value: "Month",
                    items: const [
                      DropdownMenuItem(value: "Month", child: Text("Month")),
                    ],
                    onChanged: null,
                  ),
                ],
              ),
              const Divider(height: 20),
             
              SizedBox(
                height: height - 175, 
                child: BarChart(
                  BarChartData(
                    gridData: FlGridData(show: true, horizontalInterval: 5),
                    alignment: BarChartAlignment.spaceAround,
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 5,
                          reservedSize: 32,
                          getTitlesWidget: (value, _) =>
                              Text(value.toInt().toString(), style: const TextStyle(fontSize: 10)),
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, _) {
                            final index = value.toInt();
                            if (index >= data.length) return const SizedBox();
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                data[index]['month'],
                                style: const TextStyle(fontSize: 10),
                              ),
                            );
                          },
                        ),
                      ),
                      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    ),
                    borderData: FlBorderData(show: false),
                    barGroups: data.asMap().entries.map((entry) {
                      final index = entry.key;
                      final item = entry.value;

                      return BarChartGroupData(
                        x: index,
                        barsSpace: 4,
                        barRods: [
                          BarChartRodData(
                            toY: (item['completed'] as int).toDouble(),
                            width: barWidth,
                            color: Colors.green[600],
                            borderRadius: BorderRadius.circular(4),
                          ),
                          BarChartRodData(
                            toY: (item['active'] as int).toDouble(),
                            width: barWidth,
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          BarChartRodData(
                            toY: (item['all'] as int).toDouble(),
                            width: barWidth,
                            color: Colors.blue[400],
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 16,
                runSpacing: 8,
                children: const [
                  LegendDot(color: Colors.green, label: "Completed"),
                  LegendDot(color: Colors.orangeAccent, label: "Active"),
                  LegendDot(color: Colors.blueAccent, label: "All Programs"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LegendDot extends StatelessWidget {
  final Color color;
  final String label;

  const LegendDot({super.key, required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(fontSize: 13)),
      ],
    );
  }
}
