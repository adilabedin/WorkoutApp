import 'package:flutter/material.dart';
import 'package:workout_app/models/user.dart';
import 'package:workout_app/pages/ProfilePage/profileWidgets/appbar.dart';
import 'package:workout_app/pages/ProfilePage/profileWidgets/profileWidget.dart';
import 'package:workout_app/pages/ProfilePage/userPreferences.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  User user = UserPreferences.myUser;
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: buildAppbar(context),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 32),
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {},
          ),
        ],
      ));
}
