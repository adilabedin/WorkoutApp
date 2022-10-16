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
import 'package:workout_app/views/screens/workout_screens/workout_data/body_weight_Training/bw_squats_data.dart';
import 'package:workout_app/views/screens/workout_screens/workout_data/body_weight_Training/pull_ups_data.dart';
import 'package:workout_app/views/screens/workout_screens/workout_data/body_weight_Training/sit_ups_data.dart';
import 'package:workout_app/views/screens/workout_screens/workout_data/cardio_training/cycling_data.dart';
import 'package:workout_app/views/screens/workout_screens/workout_data/cardio_training/swimming_data.dart';
import 'package:workout_app/views/screens/workout_screens/workout_data/weight_training/bench_press_data.dart';
import 'package:workout_app/views/screens/workout_screens/workout_data/weight_training/dead_lift_data.dart';
import 'package:workout_app/views/screens/workout_screens/workout_data/weight_training/should_press_data.dart';
import 'package:workout_app/views/screens/workout_screens/workout_data/weight_training/squats_data.dart';
import 'package:workout_app/views/screens/workout_video_screen/video_screen.dart';

import 'views/screens/workout_screens/workout_data/body_weight_Training/push_ups_data.dart';
import 'views/screens/workout_screens/workout_data/cardio_training/running_data.dart';

List pages = [
  VideoScreen(),
  FavouriteWorkoutsScreen(uid: authController.user.uid),
  AddWorkoutScreen(),
  MessagesScreen(),
  ProfileScreen(uid: authController.user.uid),
];

List wtPages = [
  BenchPressData(workoutType: 'Weight-Training'),
  SquatsData(workoutType: 'Weight-Training'),
  ShoulderPressData(workoutType: 'Weight-Training'),
  DeadLiftData(workoutType: 'Weight-Training'),
];
List bwPages = [
  PushUpsData(workoutType: 'Body-Weight-Training'),
  PullUpsData(workoutType: 'Body-Weight-Training'),
  BWSquatsData(workoutType: 'Body-Weight-Training'),
  SitUpsData(workoutType: 'Body-Weight-Training')
];
List cardioPages = [
  RunningData(workoutType: 'Cardio'),
  SwimmingData(workoutType: 'Cardio'),
  CyclingData(workoutType: 'Cardio')
];

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
