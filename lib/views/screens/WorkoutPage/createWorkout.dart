import 'package:flutter/material.dart';
import 'package:workout_app/views/screens/ProfilePage/profilePage.dart';
import 'package:workout_app/views/widgets/buildDescription.dart';
import 'package:workout_app/views/widgets/buildNumber.dart';
import 'package:workout_app/views/widgets/buildTitle.dart';
import 'package:workout_app/views/widgets/buttonWidget.dart';
import 'package:workout_app/views/widgets/workoutType.dart';

class CreateWorkout extends StatefulWidget {
  const CreateWorkout({Key? key}) : super(key: key);

  @override
  State<CreateWorkout> createState() => _CreateWorkoutState();
}

class _CreateWorkoutState extends State<CreateWorkout> {
  final setController = TextEditingController();
  final repController = TextEditingController();
  final timeController = TextEditingController();

  @override
  void dispose() {
    setController.dispose();
    repController.dispose();
    timeController.dispose();
    super.dispose();
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
              BuildDescription(),
              const SizedBox(height: 24),
              Row(
                children: [
                  buildNumber('Sets', setController),
                  const SizedBox(width: 24),
                  buildNumber('Reps', repController),
                  const SizedBox(width: 24),
                  buildNumber('Time', timeController),
                  const SizedBox(width: 24),
                ],
              ),
              ButtonWidget(
                text: 'Submit',
                onClicked: () {
                  // print('Title: ${BuildTitle.titleController.text}');
                  // print('Description: ${BuildDescription.descriptionController.text}');
                  // print('Sets: ${setController.text}');
                  // print('Reps: ${repController.text}');
                  // print('Time: ${timeController.text}');
                  print(WorkoutType);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfilePage()));
                },
              ),
            ],
          ),
        ),
      );

  // Widget buildTitle() => TextField(
  //       controller: titleController,
  //       decoration: InputDecoration(
  //         hintText: 'Workout Name',
  //         labelText: 'Title',
  //         //prefixIcon: Icon(Icons.mail),
  //         // icon: Icon(Icons.mail),
  //         suffixIcon: titleController.text.isEmpty
  //             ? Container(width: 0)
  //             : IconButton(
  //                 icon: Icon(Icons.close),
  //                 onPressed: () => titleController.clear(),
  //               ),
  //         border: OutlineInputBorder(),
  //       ),
  //       textInputAction: TextInputAction.done,
  //       // autofocus: true,
  //     );

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

  // Widget buildDescription(name) => Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
  //         const SizedBox(height: 8),
  //         TextField(
  //           controller: descriptionController,
  //           keyboardType: TextInputType.multiline,
  //           maxLines: null,
  //           decoration: InputDecoration(
  //             hintText: 'Enter Description',
  //             hintStyle: TextStyle(color: Colors.white70),
  //             filled: true,
  //             fillColor: Colors.white,
  //             border: OutlineInputBorder(),
  //           ),
  //         ),
  //       ],
  //     );
}
