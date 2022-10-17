import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_app/controllers/workout_data_controller.dart';
import 'package:workout_app/models/progressWT.dart';
import 'package:workout_app/views/widgets/cardio_workout_card.dart';
import 'package:workout_app/views/widgets/progressChart.dart';
import 'package:workout_app/views/widgets/workoutType.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class RunningData extends StatefulWidget {
  const RunningData({Key? key, required this.workoutType}) : super(key: key);

  final String workoutType;

  @override
  State<RunningData> createState() => _RunningDataState();
}

class _RunningDataState extends State<RunningData> {
  final WorkoutDataController workoutController =
      Get.put(WorkoutDataController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    workoutController.getRunning('cardio', 'Running');
  }

  int items = 0;
  int one = 1;
  var data = null;
  final List<ProgressWT> Rdata = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        items = workoutController.running.length;
        progressBWList();
        return PageView.builder(
          itemCount: items,
          controller: PageController(initialPage: items, viewportFraction: 1),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            data = workoutController.running[index];

            return Column(children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        data.title + ' workout $index',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      CardioWorkoutCard(
                        workoutType: data.workoutType,
                        title: data.title,
                        description: data.description,
                        lapDistance: data.lapDistance,
                        laps: data.laps,
                        restTime: data.restTime,
                      ),
                      Text(
                        'Timer: ' + data.workoutTime.toString() + 's',
                        style: TextStyle(color: Colors.white, fontSize: 18),
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
    for (int i = 0; i < workoutController.running.length; i++) {
      Rdata.add(ProgressWT(
          workoutName: workoutController.running[i].workoutTime,
          weightused: workoutController.running[i].laps,
          barColor: charts.ColorUtil.fromDartColor(Colors.green)));
    }
  }
}
