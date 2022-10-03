import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:workout_app/views/screens/WorkoutPage/createWorkout.dart';
import 'package:workout_app/views/screens/WorkoutPage/quickWorkout.dart';
import 'package:workout_app/views/screens/search_screen.dart';

class FavouriteWorkouts extends StatefulWidget {
  const FavouriteWorkouts({super.key});

  @override
  State<FavouriteWorkouts> createState() => _FavouriteWorkoutsState();
}

class _FavouriteWorkoutsState extends State<FavouriteWorkouts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Discover New Workouts"),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(SearchScreen());
              },
              icon: Icon(Icons.search, size: 30))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Scrollbar(
                thumbVisibility: false,
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const ListTile(
                                leading: Icon(Icons.album),
                                title: Text('Quick Workout'),
                                subtitle: Text('Weight-Training'),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  TextButton(
                                    child: const Text('Start Workout'),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  QuickWorkout()));
                                    },
                                  ),
                                  const SizedBox(width: 8),
                                  TextButton(
                                    child: const Text('Edit'),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CreateWorkout()));
                                    },
                                  ),
                                  const SizedBox(width: 8),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
