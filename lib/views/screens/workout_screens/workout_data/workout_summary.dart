import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:workout_app/controllers/workout_data_controller.dart';
import 'package:workout_app/views/screens/home_screen.dart';
import 'package:workout_app/views/screens/workout_screens/workout_data/used_workout_data.dart';
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
          Text(widget.workoutType),
          Text(widget.workoutName),
          Text(widget.description),
          Text(widget.workoutTime),
          Text(widget.sets.toString()),
          Text(widget.reps.toString()),
          Text(widget.restTime.toString()),
          SizedBox(
            width: 80,
            height: 80,
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
