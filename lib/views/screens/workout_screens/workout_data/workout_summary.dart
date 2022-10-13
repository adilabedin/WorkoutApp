import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:workout_app/controllers/workout_data_controller.dart';
import 'package:workout_app/views/screens/workout_video_screen/video_screen.dart';
import 'package:workout_app/views/screens/workout_screens/workout_data/workout_data_screen.dart';
import 'package:workout_app/views/widgets/text_input_field.dart';
import 'package:workout_app/views/widgets/workoutType.dart';

class WorkoutSummary extends StatefulWidget {
  WorkoutSummary({
    Key? key,
    required this.workoutName,
    required this.description,
    required this.workoutTime,
    required this.sets,
    required this.reps,
    required this.restTime,
  }) : super(key: key);

  final String workoutName;
  final String description;
  final String workoutTime;
  final String sets;
  final String reps;
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

  final String workoutType = "Weight-Training";

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
          Text(workoutType),
          Text(widget.workoutName),
          Text(widget.description),
          Text(widget.workoutTime),
          Text(widget.sets),
          Text(widget.reps),
          SizedBox(
            width: 80,
            height: 80,
            child: TextFormField(
              controller: _workoutWeightUsed,
              decoration: InputDecoration(
                hintText: 'Sets...',
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
                    workoutDataController.saveWorkout(
                      workoutType,
                      widget.workoutName,
                      widget.description,
                    );
                    workoutDataController.saveWorkoutSummary(
                        workoutType,
                        widget.workoutName,
                        widget.description,
                        widget.sets,
                        widget.reps,
                        widget.restTime,
                        int.parse(_workoutWeightUsed.text),
                        widget.workoutTime);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const WorkoutData();
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
                                        return VideoScreen();
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
