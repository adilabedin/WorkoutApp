import 'package:flutter/material.dart';
import 'package:workout_app/helpers/database_helper.dart';
import 'package:workout_app/models/workoutID.dart';

class CreateWorkout extends StatefulWidget {
  const CreateWorkout({Key? key}) : super(key: key);

  @override
  State<CreateWorkout> createState() => _CreateWorkoutState();
}

class _CreateWorkoutState extends State<CreateWorkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            width: 30,
                            height: 30,
                            child: Image(
                              image: AssetImage('images/backarrow.png'),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          onSubmitted: ((value) async* {
                            if (value != "") {
                              DatabaseHelper _dbHelper = DatabaseHelper();

                              WorkoutID _newWorkoutID = WorkoutID(title: value);

                              await _dbHelper.insertTask(_newWorkoutID);

                              print("new workout added");
                            }
                          }),
                          decoration: InputDecoration(hintText: "Workout Name"),
                        ),
                      ),
                    ],
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter Description of Workout',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter Description of Workout',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter Description of Workout',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter Description of Workout',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0.0,
                right: 0.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateWorkout(),
                      ),
                    );
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Image(
                      image: AssetImage("images/checkicon.png"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
