import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:workout_app/constants.dart';
import 'package:workout_app/models/cardio.dart';
import 'package:workout_app/models/weight_training.dart';
import 'package:workout_app/models/workout_data_model.dart';
import 'package:workout_app/views/widgets/workoutType.dart';

class WorkoutDataController extends GetxController {
  final Rx<List<WeightTraining>> _weightTraining = Rx<List<WeightTraining>>([]);
  final Rx<List<Cardio>> _cardio = Rx<List<Cardio>>([]);
  final Rx<List<WeightTraining>> _bodyWeight = Rx<List<WeightTraining>>([]);

  List<WeightTraining> get weightTraining => _weightTraining.value;
  List<Cardio> get cardio => _cardio.value;
  List<WeightTraining> get bodyWeight => _bodyWeight.value;

  getWeightWorkout(String workoutType) async {
    String uid = firebaseAuth.currentUser!.uid;
    _weightTraining.bindStream(firestore
        .collection('users')
        .doc(uid)
        .collection(workoutType)
        .snapshots()
        .map((QuerySnapshot query) {
      List<WeightTraining> retVal = [];
      for (var elem in query.docs) {
        retVal.add(WeightTraining.fromSnap(elem));
      }
      return retVal;
    }));
  }

  getBodyWorkout(String workoutType) async {
    String uid = firebaseAuth.currentUser!.uid;
    _bodyWeight.bindStream(firestore
        .collection('users')
        .doc(uid)
        .collection(workoutType)
        .snapshots()
        .map((QuerySnapshot query) {
      List<WeightTraining> retVal = [];
      for (var elem in query.docs) {
        retVal.add(WeightTraining.fromSnap(elem));
      }
      return retVal;
    }));
  }

  getCardioWorkout(String workoutType) async {
    String uid = firebaseAuth.currentUser!.uid;
    _cardio.bindStream(firestore
        .collection('users')
        .doc(uid)
        .collection(workoutType)
        .snapshots()
        .map((QuerySnapshot query) {
      List<Cardio> retVal = [];
      for (var elem in query.docs) {
        retVal.add(Cardio.fromSnap(elem));
      }
      return retVal;
    }));
  }

  saveBodyWeightSummary(
      String workoutType,
      String title,
      String description,
      int sets,
      int reps,
      int restTime,
      int workoutWeight,
      String workoutTime) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;
      var allDocs = await firestore
          .collection('users')
          .doc(uid)
          .collection(workoutType)
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
          .doc(title + ' $len')
          .set(
            weightTraining.toJson(),
          );
    } catch (e) {
      Get.snackbar(
        'Error Uploading workout data',
        e.toString(),
      );
    }
  }

  saveWeightTrainingSummary(
      String workoutType,
      String title,
      String description,
      int sets,
      int reps,
      int restTime,
      int workoutWeight,
      String workoutTime) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;
      var allDocs = await firestore
          .collection('users')
          .doc(uid)
          .collection(workoutType)
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
          .doc(title + ' $len')
          .set(
            weightTraining.toJson(),
          );
    } catch (e) {
      Get.snackbar(
        'Error Uploading workout data',
        e.toString(),
      );
    }
  }

  saveCardioSummary(String workoutType, String title, String description,
      int lapDistance, int laps, int restTime, String workoutTime) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;
      var allDocs = await firestore
          .collection('users')
          .doc(uid)
          .collection(workoutType)
          .get();
      int len = allDocs.docs.length;

      Cardio cardio = Cardio(
        uid: uid,
        id: title,
        workoutType: workoutType,
        title: title,
        description: description,
        laps: laps,
        lapDistance: lapDistance,
        restTime: restTime,
        workoutTime: workoutTime,
      );

      await firestore
          .collection('users')
          .doc(uid)
          .collection(workoutType)
          .doc(title + ' $len')
          .set(
            cardio.toJson(),
          );
    } catch (e) {
      Get.snackbar(
        'Error Uploading workout data',
        e.toString(),
      );
    }
  }
}
