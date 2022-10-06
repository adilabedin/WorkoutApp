import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:workout_app/views/screens/Discover/discover.dart';
import 'package:workout_app/views/screens/HomePage/home.dart';
import 'package:workout_app/views/screens/InboxPage/inbox.dart';
import 'package:workout_app/views/screens/ProfilePage/profilePage.dart';
import 'package:workout_app/views/screens/WorkoutPage/createWorkout.dart';
import 'package:workout_app/views/screens/WorkoutPage/workout.dart';
import 'package:workout_app/views/screens/WorkoutPage/quickWorkout.dart';

class WorkoutData extends StatefulWidget {
  const WorkoutData({Key? key}) : super(key: key);

  @override
  State<WorkoutData> createState() => _WorkoutDataState();
}

class _WorkoutDataState extends State<WorkoutData> {
  int _selectedIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  bool showLeading = true;
  bool showTrailing = true;
  double groupAligment = -1.0;
  final screens = [Home(), Discover(), Workout(), Inbox(), ProfilePage()];

  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WorkoutData'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(CreateWorkout());
              },
              icon: Icon(Icons.add_circle_rounded, size: 30)),
        ],
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
                      selectedIndex: _selectedIndex,
                      onDestinationSelected: (int index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
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
              child: Text('selectedIndex: $_selectedIndex'),
            ),
          )
        ],
      ),
    );
  }

  Widget buildPages() {
    switch (_selectedIndex) {
      case 0:
        return QuickWorkout();
      case 1:
        return QuickWorkout();
      case 2:
        return QuickWorkout();
      default:
        return QuickWorkout();
    }
  }
}
