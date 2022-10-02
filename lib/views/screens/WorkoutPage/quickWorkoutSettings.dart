import 'package:flutter/material.dart';
import 'package:workout_app/views/screens/WorkoutPage/quickWorkout.dart';
import 'package:workout_app/views/widgets/buildDescription.dart';
import 'package:workout_app/views/widgets/buildNumber.dart';
import 'package:workout_app/views/widgets/buildTitle.dart';
import 'package:workout_app/views/widgets/buttonWidget.dart';
import 'package:workout_app/views/widgets/workoutType.dart';

class QuickWorkoutSettings extends StatefulWidget {
  const QuickWorkoutSettings({Key? key}) : super(key: key);

  @override
  State<QuickWorkoutSettings> createState() => _WorkoutTimerSettingsState();
}

class _WorkoutTimerSettingsState extends State<QuickWorkoutSettings> {
  final timeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: ListView(
            children: [
              const SizedBox(height: 24),
              SizedBox(width: 80, child: WorkoutType()),
              const SizedBox(height: 24),
              BuildTitle(),
              const SizedBox(height: 24),
              BuildNumber(name: 'sets', controller: timeController),
              ButtonWidget(
                text: 'Continue',
                onClicked: () {
                  print(WorkoutType);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => QuickWorkout()));
                },
              ),
            ],
          ),
        ));
  }
}
