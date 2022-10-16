import 'package:charts_flutter/flutter.dart' as charts;

class ProgressWT {
  final String workoutNumber;
  final int weightused;
  final charts.Color barColor;

  ProgressWT({
    required this.workoutNumber,
    required this.weightused,
    required this.barColor,
  });
}
