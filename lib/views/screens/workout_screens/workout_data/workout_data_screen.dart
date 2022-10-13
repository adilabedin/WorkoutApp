import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:workout_app/constants.dart';
import 'package:workout_app/views/screens/home_screen.dart';

class WorkoutData extends StatefulWidget {
  const WorkoutData({Key? key}) : super(key: key);

  @override
  State<WorkoutData> createState() => _WorkoutDataState();
}

class _WorkoutDataState extends State<WorkoutData> {
  int index = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  bool showLeading = true;
  bool showTrailing = true;
  double groupAligment = -1.0;

  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WorkoutData'),
        backgroundColor: Colors.black,
      ),
      body: Row(
        children: <Widget>[
          LayoutBuilder(
            builder: (context, constraint) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraint.maxHeight),
                  child: IntrinsicHeight(
                    child: NavigationRail(
                      selectedIndex: index,
                      onDestinationSelected: (int index) =>
                          setState(() => this.index = index),
                      labelType: NavigationRailLabelType.selected,
                      destinations: [
                        NavigationRailDestination(
                          icon: Icon(Icons.fitness_center_outlined),
                          selectedIcon: Icon(Icons.fitness_center_outlined),
                          label: Text('Bench Press'),
                        ),
                        NavigationRailDestination(
                          icon: Icon(Icons.run_circle, size: 30),
                          selectedIcon: Icon(Icons.run_circle, size: 30),
                          label: Text('Running'),
                        ),
                        NavigationRailDestination(
                          icon: Icon(Icons.directions_bike),
                          selectedIcon: Icon(Icons.directions_bike),
                          label: Text('Cycling'),
                        ),
                        NavigationRailDestination(
                          icon: Icon(Icons.pool),
                          selectedIcon: Icon(Icons.pool),
                          label: Text('swimming'),
                        ),
                        NavigationRailDestination(
                          icon: Icon(Icons.pool),
                          selectedIcon: Icon(Icons.pool),
                          label: Text('swimming'),
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
    return pages[index]; //change this
  }
}
