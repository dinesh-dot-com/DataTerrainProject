
class PlannedProgram {
  final int count;
  final String label;
  final int color;

  PlannedProgram({
    required this.count,
    required this.label,
    required this.color,
  });

  factory PlannedProgram.fromMap(Map<String, dynamic> map) {
    return PlannedProgram(
      count: map['count'],
      label: map['label'],
      color: map['color'],
    );
  }
}

class ProgramStatusMetric {
  final String month;
  final int all;
  final int active;
  final int completed;

  ProgramStatusMetric({
    required this.month,
    required this.all,
    required this.active,
    required this.completed,
  });

  factory ProgramStatusMetric.fromMap(Map<String, dynamic> map) {
    return ProgramStatusMetric(
      month: map['month'],
      all: map['all'],
      active: map['active'],
      completed: map['completed'],
    );
  }
}
