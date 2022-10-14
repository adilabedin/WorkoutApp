import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:workout_app/constants.dart';
import 'package:workout_app/controllers/workout_data_controller.dart';
import 'package:workout_app/views/screens/home_screen.dart';

import '../../../widgets/my_tab_item.dart';

class altWorkoutDataScreen extends StatefulWidget {
  const altWorkoutDataScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<altWorkoutDataScreen> createState() => _altWorkoutDataScreenState();
}

class _altWorkoutDataScreenState extends State<altWorkoutDataScreen> {
  final WorkoutDataController dataController = Get.put(WorkoutDataController());
  bool showLeading = true;
  bool showTrailing = true;
  int pageIdx = 0;

  bool isClicked = false;

  List<MyTabItem> _items = [
    MyTabItem('Home', Icons.home),
    MyTabItem('Business', Icons.business),
    MyTabItem('School', Icons.school),
  ];

  List<String> items = ['Home', 'Business', 'School'];

  @override
  Widget build(BuildContext context) {
    final data = dataController.workouts[0];
    return Scaffold(
      appBar: AppBar(
        title: Text('WorkoutData'),
        backgroundColor: Colors.black,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (idx) {
          setState(() {
            pageIdx = idx;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: backgroundColor,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.blue,
        currentIndex: pageIdx,
        items: getBottomTabs(_items),
      ),
      body: pages[pageIdx],
    );
  }

  List<BottomNavigationBarItem> getBottomTabs(List<MyTabItem> tabs) {
    return tabs
        .map(
          (item) => BottomNavigationBarItem(
            icon: Icon(item.icon),
            label: item.name,
          ),
        )
        .toList();
  }
}
