import 'package:charts_flutter/flutter.dart' as charts;
import 'package:cloud_firestore/cloud_firestore.dart';

class ProgressWT {
  final String workoutName;
  final int weightused;
  final charts.Color barColor;

  ProgressWT({
    required this.workoutName,
    required this.weightused,
    required this.barColor,
  });
}
