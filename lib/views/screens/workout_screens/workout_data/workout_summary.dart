import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:workout_app/controllers/workout_data_controller.dart';
import 'package:workout_app/views/screens/home_screen.dart';
import 'package:workout_app/views/screens/workout_screens/workout_data/workout_data.dart';
import 'package:workout_app/views/screens/workout_video_screen/video_screen.dart';
import 'package:workout_app/views/screens/workout_screens/workout_data/weight_training/wt_workout_data_screen.dart';
import 'package:workout_app/views/widgets/text_input_field.dart';
import 'package:workout_app/views/widgets/workoutType.dart';

class WorkoutSummary extends StatefulWidget {
  WorkoutSummary({
    Key? key,
    required this.workoutType,
    required this.workoutName,
    required this.description,
    required this.workoutTime,
    required this.sets,
    required this.reps,
    required this.restTime,
  }) : super(key: key);

  final String workoutType;
  final String workoutName;
  final String description;
  final String workoutTime;
  final int sets;
  final int reps;
  int restTime;

  @override
  State<WorkoutSummary> createState() => _WorkoutSummaryState();
}

class _WorkoutSummaryState extends State<WorkoutSummary> {
  var workoutWeight;

  var _workoutWeightUsed = TextEditingController();

  @override
  void initState() {
    super.initState();

    _workoutWeightUsed.addListener(_updateText);
  }

  @override
  void dispose() {
    _workoutWeightUsed.dispose();
  }

  void _updateText() {
    setState(() {
      workoutWeight = _workoutWeightUsed.text;
    });
  }

  WorkoutDataController workoutDataController =
      Get.put(WorkoutDataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Summary'),
        centerTitle: true,
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
      ),
      body: Center(
          child: Column(
        children: [
          Text(
            widget.workoutType + ': ' + widget.workoutName,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              child: Column(
            children: [
              Text('Description:'),
              Text(widget.description),
            ],
          )),
          SizedBox(
            height: 10,
          ),
          Container(child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            if (widget.workoutType == 'Weight-Training') {
              return SizedBox(
                child: Column(
                  children: [
                    Text('Sets:' + widget.sets.toString()),
                    Text('Reps:' + widget.reps.toString()),
                    Text('Rest Time: ' + widget.restTime.toString()),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text('Workout Weight Used: '),
                          SizedBox(
                            height: 80,
                            width: 80,
                            child: TextFormField(
                              controller: _workoutWeightUsed,
                              decoration: InputDecoration(
                                hintText: '',
                                hintStyle: TextStyle(color: Colors.blue),
                                filled: true,
                                fillColor: Colors.black,
                                border: OutlineInputBorder(),
                              ),
                              style: TextStyle(color: Colors.blue),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else if (widget.workoutType == 'Body-Weight-Training') {
              return SizedBox(
                  width: 400,
                  height: 80,
                  child: Column(children: [
                    Text('Sets:' + widget.sets.toString()),
                    Text('Reps:' + widget.reps.toString()),
                    Text('Rest Time: ' + widget.restTime.toString()),
                  ]));
            } else {
              return Center(
                child:
                    Text('Distance Covered: ' + widget.sets.toString() + 'm'),
              );
            }
          })),
          Text('Time Taken: ' + widget.workoutTime),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    workoutDataController.saveWorkout(widget.workoutType,
                        widget.workoutName, widget.description);
                    if (widget.workoutType == 'Weight-Training') {
                      workoutDataController.saveWeightTrainingSummary(
                          widget.workoutType,
                          widget.workoutName,
                          widget.description,
                          widget.sets,
                          widget.reps,
                          widget.restTime,
                          int.parse(_workoutWeightUsed.text),
                          widget.workoutTime);
                    } else if (widget.workoutType == 'cardio') {
                      workoutDataController.saveCardioSummary(
                          widget.workoutType,
                          widget.workoutName,
                          widget.description,
                          widget.sets,
                          widget.reps,
                          widget.restTime,
                          widget.workoutTime);
                    } else if (widget.workoutType == 'Body-Weight-Training') {
                      workoutDataController.saveBodyWeightSummary(
                          widget.workoutType,
                          widget.workoutName,
                          widget.description,
                          widget.sets,
                          widget.reps,
                          widget.restTime,
                          int.parse(_workoutWeightUsed.text),
                          widget.workoutTime);
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return WorkoutData();
                        },
                      ),
                    );
                  },
                  child: Text('save')),
              SizedBox(width: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.red),
                onPressed: () {
                  child:
                  showDialog(
                    context: context,
                    builder: ((context) => AlertDialog(
                          title: Text('Would you like to delete workout?'),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return HomeScreen();
                                      },
                                    ),
                                  );
                                },
                                child: Text('Yes')),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('No'),
                            )
                          ],
                        )),
                  );
                },
                child: Text('delete'),
              )
            ],
          )
        ],
      )),
    );
  }
}
