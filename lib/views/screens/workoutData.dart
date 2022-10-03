import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
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
        ),
        body: Center(
            child: Row(
          children: [
            NavigationRail(
              selectedIndex: _selectedIndex,
              groupAlignment: groupAligment,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              labelType: labelType,
              leading: Text('Excercises'),
              trailing: FloatingActionButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CreateWorkout()));
                },
                child: const Icon(Icons.add),
              ),
              destinations: const <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: Icon(Icons.favorite_border),
                  selectedIcon: Icon(Icons.favorite),
                  label: Text('Bench Press'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.bookmark_border),
                  selectedIcon: Icon(Icons.book),
                  label: Text('Squats'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.star_border),
                  selectedIcon: Icon(Icons.star),
                  label: Text('Pull ups'),
                ),
              ],
            ),
            Expanded(child: buildPages()),
          ],
        )));
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
