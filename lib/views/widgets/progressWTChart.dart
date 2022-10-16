import 'package:flutter/material.dart';
import 'package:workout_app/models/progressWT.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ProgressWTChart extends StatelessWidget {
  final List<ProgressWT> data;

  ProgressWTChart({required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<ProgressWT, String>> series = [
      charts.Series(
        id: 'workoutNumber',
        data: data,
        domainFn: (ProgressWT series, _) => series.workoutNumber,
        measureFn: (ProgressWT series, _) => series.weightused,
        colorFn: (ProgressWT series, _) => series.barColor,
      )
    ];
    return Container(
      height: 340,
      padding: EdgeInsets.all(20.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Text('Progress'),
              Expanded(
                child: charts.BarChart(
                  series,
                  animate: true,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
