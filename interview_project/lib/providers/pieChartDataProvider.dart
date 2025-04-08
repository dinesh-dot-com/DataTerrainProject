import 'package:flutter_riverpod/flutter_riverpod.dart';

class PieChartDataModel {
  final String title;
  final int totalPrograms;
  final Map<String, int> data;

  PieChartDataModel({
    required this.title,
    required this.totalPrograms,
    required this.data,
  });
}

final pieChartDataProvider = Provider<List<PieChartDataModel>>((ref) {
  return [
    PieChartDataModel(
      title: 'Program Type Metrics',
      totalPrograms: 94,
      data: {
        'Premium': 40,
        'Free': 54,
      },
    ),
    PieChartDataModel(
      title: 'Program Mode Metrics',
      totalPrograms: 96,
      data: {
        'Virtual': 36,
        'Physical': 50,
      },
    ),
  ];
});
