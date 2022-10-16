import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/controllers/auth_controller.dart';
import 'package:workout_app/views/screens/create_workout/add_workout_screen.dart';
import 'package:workout_app/views/screens/workout_screens/favourite_workouts/favourite_workout_video_screen.dart';
import 'package:workout_app/views/screens/workout_screens/favourite_workouts/favourite_workouts_screen.dart';
import 'package:workout_app/views/screens/messages_screen.dart';
import 'package:workout_app/views/screens/profile_screen.dart';
import 'package:workout_app/views/screens/workout_screens/workout_data/workout_data_dynamic_screen.dart';
import 'package:workout_app/views/screens/workout_video_screen/video_screen.dart';

List pages = [
  VideoScreen(),
  FavouriteWorkoutsScreen(uid: authController.user.uid),
  AddWorkoutScreen(),
  MessagesScreen(),
  ProfileScreen(uid: authController.user.uid),
];

List wtPages = [WorkoutDataDynamicScreen(workoutType: 'Weight-Training')];
List bwPages = [WorkoutDataDynamicScreen(workoutType: 'Body-Weight-Training')];
List cardioPages = [];

// COLORS
const backgroundColor = Colors.black;
var buttonColor = Colors.blue;
const borderColor = Colors.white;

// FIREBASE
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

// CONTROLLER
var authController = AuthController.instance;
