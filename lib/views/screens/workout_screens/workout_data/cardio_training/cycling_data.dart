import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_app/controllers/workout_data_controller.dart';
import 'package:workout_app/models/progressWT.dart';
import 'package:workout_app/views/widgets/progressChart.dart';
import 'package:workout_app/views/widgets/workoutType.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class CyclingData extends StatefulWidget {
  const CyclingData({Key? key, required this.workoutType}) : super(key: key);

  final String workoutType;

  @override
  State<CyclingData> createState() => _CyclingDataState();
}

class _CyclingDataState extends State<CyclingData> {
  final WorkoutDataController workoutController =
      Get.put(WorkoutDataController());

  int items = 0;
  int one = 1;
  var data = null;
  final List<ProgressWT> Rdata = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        items = workoutController.cycling.length;
        progressBWList();
        return PageView.builder(
          itemCount: items,
          controller: PageController(initialPage: items, viewportFraction: 1),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            data = workoutController.cycling[index];

            return Column(children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        data.title + ' workout $index',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      Text(
                        data.laps.toString() + ' laps',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      Text(
                        data.lapDistance.toString() + ' lap Distance',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      Text(
                        data.restTime.toString() + ' rest time',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      Text(
                        data.workoutTime.toString() + ' workout duration',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      ProgressChart(
                        data: Rdata,
                      )
                    ],
                  ),
                ),
              )
            ]);
          },
        );
      }),
    );
  }

  progressBWList() {
    for (int i = 0; i < workoutController.cycling.length; i++) {
      Rdata.add(ProgressWT(
          workoutName: workoutController.cycling[i].workoutTime,
          weightused: workoutController.cycling[i].laps,
          barColor: charts.ColorUtil.fromDartColor(Colors.green)));
    }
  }
}
