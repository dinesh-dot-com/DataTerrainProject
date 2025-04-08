
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/program_metrics.dart';

final plannedProgramsProvider = Provider<List<PlannedProgram>>((ref) {
  return [
    {
      "count": 327,
      "label": "Programs",
      "color": 0xFFFFF2D9,
    },
    {
      "count": 120,
      "label": "Mentors",
      "color": 0xFFD9FAF4,
    },
    {
      "count": 556,
      "label": "Mentees",
      "color": 0xFFEFE2FD,
    },
  ].map((map) => PlannedProgram.fromMap(map)).toList();
});

final programStatusMetricsProvider = Provider<List<ProgramStatusMetric>>((ref) {
  return [
    {
      "month": "Jan",
      "all": 30,
      "active": 8,
      "completed": 6,
    },
    {
      "month": "Feb",
      "all": 45,
      "active": 45,
      "completed": 44,
    },
    {
      "month": "Mar",
      "all": 55,
      "active": 30,
      "completed": 55,
    },
  ].map((map) => ProgramStatusMetric.fromMap(map)).toList();
});
