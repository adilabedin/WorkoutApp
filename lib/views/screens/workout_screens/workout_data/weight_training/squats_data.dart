import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_app/controllers/workout_data_controller.dart';
import 'package:workout_app/models/progressWT.dart';
import 'package:workout_app/views/widgets/progressChart.dart';
import 'package:workout_app/views/widgets/workoutType.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SquatsData extends StatefulWidget {
  const SquatsData({Key? key, required this.workoutType}) : super(key: key);

  final String workoutType;

  @override
  State<SquatsData> createState() => _SquatsDataState();
}

class _SquatsDataState extends State<SquatsData> {
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
        items = workoutController.squats.length;
        progressWTList();

        return PageView.builder(
          itemCount: items,
          controller: PageController(initialPage: items, viewportFraction: 1),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            data = workoutController.squats[index];

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
                        data.sets.toString() + ' sets',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      Text(
                        data.reps.toString() + ' reps',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      Text(
                        data.restTime.toString() + ' rest time',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      Text(
                        data.workoutWeight.toString() + ' weight used',
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

  progressWTList() {
    for (int i = 0; i < workoutController.squats.length; i++) {
      Rdata.add(ProgressWT(
          workoutName: workoutController.squats[i].workoutTime,
          weightused: workoutController.squats[i].workoutWeight,
          barColor: charts.ColorUtil.fromDartColor(Colors.green)));
    }
  }
}
