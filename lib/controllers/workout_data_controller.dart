import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:workout_app/constants.dart';
import 'package:workout_app/models/weight_training.dart';
import 'package:workout_app/models/workout_data_model.dart';

class WorkoutDataController extends GetxController {
  saveWorkout(String workoutType, String title, String description) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;
      WorkoutData video = WorkoutData(
        uid: uid,
        id: title,
        workoutType: workoutType,
        title: title,
        description: description,
      );

      await firestore
          .collection('users')
          .doc(uid)
          .collection(workoutType)
          .doc(title)
          .set(
            video.toJson(),
          );
    } catch (e) {
      Get.snackbar(
        'Error Uploading workout data',
        e.toString(),
      );
    }
  }

  saveWorkoutSummary(
      String workoutType,
      String title,
      String description,
      String sets,
      String reps,
      int restTime,
      int workoutWeight,
      String workoutTime) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;
      var allDocs = await firestore
          .collection('users')
          .doc(uid)
          .collection(workoutType)
          .doc(title)
          .collection('workouts')
          .get();
      int len = allDocs.docs.length;

      WeightTraining video = WeightTraining(
        uid: uid,
        id: title,
        workoutType: workoutType,
        title: title,
        description: description,
        sets: sets,
        reps: reps,
        restTime: restTime,
        workoutWeight: workoutWeight,
        workoutTime: workoutTime,
      );

      await firestore
          .collection('users')
          .doc(uid)
          .collection(workoutType)
          .doc(title)
          .collection('Workout History')
          .doc('workout $len')
          .set(
            video.toJson(),
          );
    } catch (e) {
      Get.snackbar(
        'Error Uploading workout data',
        e.toString(),
      );
    }
  }
}
