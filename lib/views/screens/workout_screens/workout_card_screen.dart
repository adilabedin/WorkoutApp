import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class WorkoutCardScreen extends StatefulWidget {
  final String id;
  WorkoutCardScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<WorkoutCardScreen> createState() => _WorkoutCardScreenState();
}

class _WorkoutCardScreenState extends State<WorkoutCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
