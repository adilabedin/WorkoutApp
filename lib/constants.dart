import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/controllers/auth_controller.dart';
import 'package:workout_app/views/screens/WorkoutPage/workout.dart';
import 'package:workout_app/views/screens/add_video_screen.dart';
import 'package:workout_app/views/screens/favouriteWorkouts.dart';
import 'package:workout_app/views/screens/messages_screen.dart';
import 'package:workout_app/views/screens/profile_screen.dart';
import 'package:workout_app/views/screens/video_screen.dart';

List pages = [
  VideoScreen(),
  FavouriteWorkouts(),
  AddVideoScreen(),
  MessagesScreen(),
  ProfileScreen(uid: authController.user.uid),
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
