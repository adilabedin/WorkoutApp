import 'package:flutter/material.dart';
import 'package:workout_app/providers/quick_workout_provider.dart';
import 'package:workout_app/views/screens/workout_screens/workout_data/used_workout_data.dart';
import 'dart:async';

import 'package:workout_app/views/screens/workout_screens/workout_data/wt_workout_data_screen.dart';

class BuildWorkoutTimer extends StatefulWidget {
  const BuildWorkoutTimer({Key? key}) : super(key: key);

  @override
  State<BuildWorkoutTimer> createState() => _BuildWorkoutTimerState();
}

class _BuildWorkoutTimerState extends State<BuildWorkoutTimer> {
  QuickWorkoutProvider workoutProvider = QuickWorkoutProvider();

  int timeLeft = 0;
  int set = 0;
  int seconds = 0, minutes = 0, hours = 0;
  String digitSeconds = "00", digitMinutes = "00", digitHours = "00";
  Timer? timer;
  bool started = false;
  List Sets = [];

  String? get name => null;

  void stop() {
    timer!.cancel();
    setState(() {
      started = false;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => UsedWorkoutData()));
    });
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

  void addSets() {
    String set = "$digitHours:$digitMinutes:$digitSeconds";
    setState(() {
      Sets.add(set);
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

  void _startCountdown() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (timeLeft > 0) {
          timeLeft--;
        } else {
          timer.cancel();
          set++;
          timeLeft = 60;
          final stopwatch = Stopwatch()..start();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildWorkoutTimer();
  }

  buildWorkoutTimer() => Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Workout',
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
