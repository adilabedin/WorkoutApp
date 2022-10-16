import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_app/controllers/workout_data_controller.dart';
import 'package:workout_app/models/progressWT.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ProgressWTChart extends StatelessWidget {
  List<ProgressWT> data = [];

  ProgressWTChart({required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<ProgressWT, String>> series = [
      charts.Series(
        id: 'workoutNumber',
        data: data,
        domainFn: (ProgressWT series, _) => series.workoutName,
        measureFn: (ProgressWT series, _) => series.weightused,
        colorFn: (ProgressWT series, _) => series.barColor,
      )
    ];
    return Container(
      height: 350,
      padding: EdgeInsets.all(20.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Text('Show progress'),
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
