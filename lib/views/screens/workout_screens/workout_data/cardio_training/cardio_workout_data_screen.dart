import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:workout_app/constants.dart';
import 'package:workout_app/controllers/workout_data_controller.dart';
import 'package:workout_app/views/screens/home_screen.dart';

class CardioWorkoutDataScreen extends StatefulWidget {
  const CardioWorkoutDataScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CardioWorkoutDataScreen> createState() =>
      _CardioWorkoutDataScreenState();
}

class _CardioWorkoutDataScreenState extends State<CardioWorkoutDataScreen> {
  final WorkoutDataController dataController = Get.put(WorkoutDataController());

  int index = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  bool showLeading = true;
  bool showTrailing = true;
  double groupAligment = -1.0;

  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          LayoutBuilder(
            builder: (context, constraint) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      minHeight: constraint.maxHeight, maxWidth: 80),
                  child: IntrinsicHeight(
                    child: NavigationRail(
                      selectedIndex: index,
                      onDestinationSelected: (int index) =>
                          setState(() => this.index = index),
                      labelType: NavigationRailLabelType.all,
                      destinations: [
                        NavigationRailDestination(
                          icon: Icon(Icons.fitness_center_outlined),
                          selectedIcon: Icon(Icons.fitness_center_outlined),
                          label:
                              Text('Running', style: TextStyle(fontSize: 11)),
                        ),
                        NavigationRailDestination(
                          icon: Icon(Icons.fitness_center_outlined),
                          selectedIcon: Icon(Icons.fitness_center_outlined),
                          label:
                              Text('Swimming', style: TextStyle(fontSize: 11)),
                        ),
                        NavigationRailDestination(
                          icon: Icon(Icons.fitness_center_outlined),
                          selectedIcon: Icon(Icons.fitness_center_outlined),
                          label:
                              Text('Cycling', style: TextStyle(fontSize: 11)),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          VerticalDivider(thickness: 1, width: 1),
          // This is the main content.
          Expanded(
            child: Center(
              child: buildPages(),
            ),
          )
        ],
      ),
    );
  }

  Widget buildPages() {
    return cardioPages[index]; //change this
  }
}
