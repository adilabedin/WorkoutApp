import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:workout_app/views/screens/ProfilePage/profilePage.dart';
import 'package:workout_app/views/widgets/buildTitle.dart';
import 'package:workout_app/views/widgets/buttonWidget.dart';
import 'package:workout_app/views/widgets/workoutType.dart';

class WorkoutSummary extends StatefulWidget {
  const WorkoutSummary({Key? key}) : super(key: key);

  @override
  State<WorkoutSummary> createState() => _WorkoutSummaryState();
}

class _WorkoutSummaryState extends State<WorkoutSummary> {
  final weightController = TextEditingController();

  @override
  void dispose() {
    weightController.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(backgroundColor: Colors.black),
        body: Center(
          child: ListView(
            padding: EdgeInsets.all(32),
            children: [
              SizedBox(width: 80, child: WorkoutType()),
              const SizedBox(height: 24),
              BuildTitle(),
              const SizedBox(height: 24),
              Row(
                children: [
                  buildNumber('Weight used', weightController),
                  const SizedBox(width: 24),
                ],
              ),
              Row(
                children: [
                  ButtonWidget(
                    text: 'Delete',
                    onClicked: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()));
                    },
                  ),
                  ButtonWidget(
                    text: 'Save',
                    onClicked: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  Widget buildNumber(name, numberController) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          SizedBox(
            width: 80,
            height: 80,
            child: TextField(
              controller: numberController,
              decoration: InputDecoration(
                hintText: 'Enter number...',
                hintStyle: TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.number,
            ),
          ),
        ],
      );
}
