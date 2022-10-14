import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:workout_app/constants.dart';
import 'package:workout_app/models/weight_training.dart';
import 'package:workout_app/models/workout_data_model.dart';
import 'package:workout_app/views/widgets/workoutType.dart';

class WorkoutDataController extends GetxController {
  final Rx<List<WeightTraining>> _WeightTrainingWorkout =
      Rx<List<WeightTraining>>([]);
  List<WeightTraining> get workouts => _WeightTrainingWorkout.value;

  saveWorkout(String workoutType, String title, String description, String sets,
      String reps, int restTime, int workoutWeight, String workoutTime) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;
      var allDocs = await firestore
          .collection('users')
          .doc(uid)
          .collection(workoutType)
          .doc(title)
          .collection('Workout History')
          .get();
      int len = allDocs.docs.length;

      WeightTraining weightTraining = WeightTraining(
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
            weightTraining.toJson(),
          );

      _WeightTrainingWorkout.bindStream(firestore
          .collection('users')
          .doc(uid)
          .collection(workoutType)
          .doc(title)
          .collection('Workout History')
          .snapshots()
          .map((QuerySnapshot query) {
        List<WeightTraining> retVal = [];
        for (var elem in query.docs) {
          retVal.add(WeightTraining.fromSnap(elem));
        }
        return retVal;
      }));
    } catch (e) {
      Get.snackbar(
        'Error Uploading workout data',
        e.toString(),
      );
    }
  }
}
