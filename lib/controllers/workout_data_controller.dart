import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:workout_app/constants.dart';
import 'package:workout_app/models/weight_training.dart';
import 'package:workout_app/models/workout_data_model.dart';

class WorkoutDataController extends GetxController {
  final Rx<List<WeightTraining>> _WeightTrainingWorkout =
      Rx<List<WeightTraining>>([]);
  List<WeightTraining> get workouts => _WeightTrainingWorkout.value;

  @override
  void getWorkoutData() async {
    String uid = firebaseAuth.currentUser!.uid;
    _WeightTrainingWorkout.bindStream(firestore
        .collection('users')
        .doc(uid)
        .collection('Weight-Training')
        .doc('Bench Press')
        .collection('Workout History')
        .snapshots()
        .map((QuerySnapshot query) {
      List<WeightTraining> retVal = [];
      for (var elem in query.docs) {
        retVal.add(WeightTraining.fromSnap(elem));
      }
      return retVal;
    }));
  }

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
