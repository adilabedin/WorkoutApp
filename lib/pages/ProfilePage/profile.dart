import 'package:flutter/material.dart';
import 'package:workout_app/pages/CreateWorkoutPage/createWorkout.dart';
import 'package:workout_app/pages/ProfilePage/profileWidgets/appbar.dart';
import 'package:workout_app/pages/ProfilePage/profileWidgets/numbersWidget.dart';
import 'package:workout_app/pages/ProfilePage/profileWidgets/profileWidget.dart';
import 'package:workout_app/pages/ProfilePage/userPreferences.dart';
import 'package:workout_app/pages/ProfilePage/profileWidgets/workoutCard.dart';
import '../../models/user.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    return Scaffold(
      appBar: buildAppbar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          buildName(user),
          const SizedBox(height: 24),
          NumbersWidget(),
          const SizedBox(height: 48),
          BuildSavedWorkouts(user)
        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget BuildSavedWorkouts(User user) => Container(
        child: WorkoutCard(),
      );
}
