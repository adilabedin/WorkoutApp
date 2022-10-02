import 'package:flutter/material.dart';
import 'dart:async';

import 'package:workout_app/views/widgets/buildWorkoutTimer.dart';

class QuickWorkout extends StatefulWidget {
  const QuickWorkout({Key? key}) : super(key: key);

  @override
  State<QuickWorkout> createState() => _QuickWorkoutState();
}

class _QuickWorkoutState extends State<QuickWorkout> {
  @override
  Widget build(BuildContext context) {
    return BuildWorkoutTimer();
  }
}
