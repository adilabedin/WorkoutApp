import 'package:flutter/material.dart';
import 'package:workout_app/providers/quick_workout_provider.dart';
import 'package:workout_app/views/screens/home_screen.dart';
import 'dart:async';

import 'package:workout_app/views/screens/workout_screens/workout_data/wt_workout_data_screen.dart';
import 'package:workout_app/views/screens/workout_screens/workout_data/workout_summary.dart';
import 'package:workout_app/views/widgets/workoutType.dart';

class QuickWorkoutScreen extends StatefulWidget {
  QuickWorkoutScreen(
      {Key? key,
      required this.workoutType,
      required this.workoutName,
      required this.description,
      required this.sets,
      required this.reps,
      required this.restTime})
      : super(key: key);

  final String workoutType;
  final String workoutName;
  final String description;
  final int sets;
  final int reps;
  int restTime;

  @override
  State<QuickWorkoutScreen> createState() => _QuickWorkoutScreenState();
}

class _QuickWorkoutScreenState extends State<QuickWorkoutScreen> {
  var workoutType;
  var workoutName;
  var description;
  var sets;
  var reps;
  var timeLeft;
  var conRestTime;

  @override
  void initState() {
    super.initState();
    workoutType = _WorkoutType(workoutType);
    workoutName = _WorkoutName(workoutName);
    description = _description(description);
    sets = _sets(sets);
    reps = _reps(reps);
    timeLeft = _updateTimeLeft(timeLeft);
    conRestTime = _ConstantRestTime(conRestTime);
  }

  _WorkoutType(workoutType) {
    setState(() {
      workoutType = widget.workoutType;
    });
    return workoutType;
  }

  _WorkoutName(workoutName) {
    setState(() {
      workoutName = widget.workoutName;
    });
    return workoutName;
  }

  _description(description) {
    setState(() {
      description = widget.description;
    });
    return description;
  }

  _sets(sets) {
    setState(() {
      sets = widget.sets;
    });
    return sets;
  }

  _reps(reps) {
    setState(() {
      reps = widget.reps;
    });
    return reps;
  }

  _updateTimeLeft(timeLeft) {
    setState(() {
      timeLeft = widget.restTime;
    });
    return timeLeft;
  }

  _ConstantRestTime(conRestTime) {
    setState(() {
      conRestTime = widget.restTime;
    });
    return timeLeft;
  }

  void _startCountdown() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (timeLeft > 0) {
          timeLeft--;
        } else {
          timer.cancel();
          set++;
          timeLeft = conRestTime;
          final stopwatch = Stopwatch()..start();
        }
      });
    });
  }

  int set = 0;
  int seconds = 0, minutes = 0, hours = 0;
  String digitSeconds = "00", digitMinutes = "00", digitHours = "00";
  Timer? timer;
  bool started = false;
  List Sets = [];

  textBoxDialogue() {
    String text = '';
    if (Sets.length + 1 == widget.sets) {
      text = 'You Completed the Workout!';
    } else {
      text = 'Would you like to stop workout?';
    }

    return text;
  }

  void stop() {
    addSets();
    showDialog(
      context: context,
      builder: ((context) => AlertDialog(
            title: Text(textBoxDialogue()),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    timer!.cancel();
                    String workoutTime = Sets.last;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return WorkoutSummary(
                              workoutType: workoutType,
                              workoutName: workoutName,
                              description: description,
                              workoutTime: workoutTime,
                              sets: sets,
                              reps: reps,
                              restTime: conRestTime);
                        },
                      ),
                    );
                  },
                  child: Text('Finsish Workout')),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('continue Workout'),
              )
            ],
          )),
    );
  }

  void stopBySets() {
    showDialog(
        context: context,
        builder: ((context) =>
            AlertDialog(title: Text(textBoxDialogue()), actions: [
              ElevatedButton(
                  onPressed: () {
                    timer!.cancel();
                    String workoutTime = Sets.last;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return WorkoutSummary(
                              workoutType: workoutType,
                              workoutName: workoutName,
                              description: description,
                              workoutTime: workoutTime,
                              sets: sets,
                              reps: reps,
                              restTime: conRestTime);
                        },
                      ),
                    );
                  },
                  child: Text('Finsish Workout')),
            ])));
  }

  void reset() {
    timer!.cancel();
    setState(() {
      seconds = 0;
      minutes = 0;
      hours = 0;

      digitSeconds = "00";
      digitMinutes = "00";
      digitHours = "00";

      started = false;
    });
  }

  addSets() {
    String set = "$digitHours:$digitMinutes:$digitSeconds";
    setState(() {
      if (Sets.length + 1 != widget.sets) {
        Sets.add(set);
      } else {
        stopBySets();
      }
    });
  }

  void start() {
    started = true;
    if (started) {
      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        int localSeconds = seconds + 1;
        int localMinutes = minutes;
        int localHours = hours;

        if (localSeconds > 59) {
          if (localMinutes > 59) {
            localHours++;
            localMinutes = 0;
          } else {
            localMinutes++;
            localSeconds = 0;
          }
        }
        setState(() {
          seconds = localSeconds;
          minutes = localMinutes;
          hours = localHours;

          digitSeconds = (seconds >= 10) ? "$seconds" : "0$seconds";
          digitMinutes = (minutes >= 10) ? "$minutes" : "0$minutes";
          digitHours = (hours >= 10) ? "$hours" : "0$hours";
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.workoutName,
                style: TextStyle(fontSize: 40),
              ),
              Text('Rest Timer'),
              Text(
                timeLeft.toString(),
                style: TextStyle(fontSize: 50),
              ),
              RawMaterialButton(
                onPressed: () {
                  addSets();
                  _startCountdown();
                },
                shape: const StadiumBorder(
                  side: BorderSide(color: Colors.blue),
                ),
                child: Text(
                  "Rest",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              Center(
                child: Text("$digitHours:$digitMinutes:$digitSeconds",
                    style: TextStyle(
                      fontSize: 50.0,
                    )),
              ),
              Text('SETS:'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Scrollbar(
                    showTrackOnHover: true,
                    child: ListView.builder(
                      itemCount: Sets.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Set Number ${index + 1}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.0),
                              ),
                              Text(
                                "${Sets[index]}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.0),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RawMaterialButton(
                    onPressed: () {
                      (!started) ? start() : stop();
                    },
                    shape: const StadiumBorder(
                      side: BorderSide(color: Colors.blue),
                    ),
                    child: Text(
                      (!started) ? "Start" : "Stop",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
