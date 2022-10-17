import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:workout_app/constants.dart';
import 'package:workout_app/models/body_weight_training.dart';
import 'package:workout_app/models/cardio.dart';
import 'package:workout_app/models/progressWT.dart';
import 'package:workout_app/models/weight_training.dart';
import 'package:workout_app/models/workout_data_model.dart';
import 'package:workout_app/views/widgets/workoutType.dart';

class WorkoutDataController extends GetxController {
  final Rx<List<WeightTraining>> _benchPress = Rx<List<WeightTraining>>([]);
  final Rx<List<WeightTraining>> _squats = Rx<List<WeightTraining>>([]);
  final Rx<List<WeightTraining>> _shoulderPress = Rx<List<WeightTraining>>([]);
  final Rx<List<WeightTraining>> _deadLift = Rx<List<WeightTraining>>([]);

  final Rx<List<Cardio>> _running = Rx<List<Cardio>>([]);
  final Rx<List<Cardio>> _swimming = Rx<List<Cardio>>([]);
  final Rx<List<Cardio>> _cycling = Rx<List<Cardio>>([]);

  final Rx<List<BodyWeightTraining>> _pushUps =
      Rx<List<BodyWeightTraining>>([]);
  final Rx<List<BodyWeightTraining>> _pullUps =
      Rx<List<BodyWeightTraining>>([]);
  final Rx<List<BodyWeightTraining>> _bwSquats =
      Rx<List<BodyWeightTraining>>([]);
  final Rx<List<BodyWeightTraining>> _sitUps = Rx<List<BodyWeightTraining>>([]);

  List<WeightTraining> get benchPress => _benchPress.value;
  List<WeightTraining> get squats => _squats.value;
  List<WeightTraining> get shoulderPress => _shoulderPress.value;
  List<WeightTraining> get deadLift => _deadLift.value;

  List<Cardio> get running => _running.value;
  List<Cardio> get swimming => _swimming.value;
  List<Cardio> get cycling => _cycling.value;

  List<BodyWeightTraining> get pushUps => _pushUps.value;
  List<BodyWeightTraining> get pullUps => _pullUps.value;
  List<BodyWeightTraining> get bwSquats => _bwSquats.value;
  List<BodyWeightTraining> get sitUps => _sitUps.value;

  getBenchPress(String workoutType, String title) async {
    String uid = firebaseAuth.currentUser!.uid;
    _benchPress.bindStream(firestore
        .collection('users')
        .doc(uid)
        .collection('workouts')
        .doc(workoutType)
        .collection(title)
        .snapshots()
        .map((QuerySnapshot query) {
      List<WeightTraining> retVal = [];
      for (var elem in query.docs) {
        retVal.add(WeightTraining.fromSnap(elem));
      }
      return retVal;
    }));
  }

  getSquats(String workoutType, String title) async {
    String uid = firebaseAuth.currentUser!.uid;
    _squats.bindStream(firestore
        .collection('users')
        .doc(uid)
        .collection('workouts')
        .doc(workoutType)
        .collection(title)
        .snapshots()
        .map((QuerySnapshot query) {
      List<WeightTraining> retVal = [];
      for (var elem in query.docs) {
        retVal.add(WeightTraining.fromSnap(elem));
      }
      return retVal;
    }));
  }

  getShoulderPress(String workoutType, String title) async {
    String uid = firebaseAuth.currentUser!.uid;
    _shoulderPress.bindStream(firestore
        .collection('users')
        .doc(uid)
        .collection('workouts')
        .doc(workoutType)
        .collection(title)
        .snapshots()
        .map((QuerySnapshot query) {
      List<WeightTraining> retVal = [];
      for (var elem in query.docs) {
        retVal.add(WeightTraining.fromSnap(elem));
      }
      return retVal;
    }));
  }

  getDeadLift(String workoutType, String title) async {
    String uid = firebaseAuth.currentUser!.uid;
    _deadLift.bindStream(firestore
        .collection('users')
        .doc(uid)
        .collection('workouts')
        .doc(workoutType)
        .collection(title)
        .snapshots()
        .map((QuerySnapshot query) {
      List<WeightTraining> retVal = [];
      for (var elem in query.docs) {
        retVal.add(WeightTraining.fromSnap(elem));
      }
      return retVal;
    }));
  }

  getPushUps(String workoutType, String title) async {
    String uid = firebaseAuth.currentUser!.uid;
    _pushUps.bindStream(firestore
        .collection('users')
        .doc(uid)
        .collection('workouts')
        .doc(workoutType)
        .collection(title)
        .snapshots()
        .map((QuerySnapshot query) {
      List<BodyWeightTraining> retVal = [];
      for (var elem in query.docs) {
        retVal.add(BodyWeightTraining.fromSnap(elem));
      }
      return retVal;
    }));
  }

  getPullUps(String workoutType, String title) async {
    String uid = firebaseAuth.currentUser!.uid;
    _pullUps.bindStream(firestore
        .collection('users')
        .doc(uid)
        .collection('workouts')
        .doc(workoutType)
        .collection(title)
        .snapshots()
        .map((QuerySnapshot query) {
      List<BodyWeightTraining> retVal = [];
      for (var elem in query.docs) {
        retVal.add(BodyWeightTraining.fromSnap(elem));
      }
      return retVal;
    }));
  }

  getBWSquats(String workoutType, String title) async {
    String uid = firebaseAuth.currentUser!.uid;
    _bwSquats.bindStream(firestore
        .collection('users')
        .doc(uid)
        .collection('workouts')
        .doc(workoutType)
        .collection(title)
        .snapshots()
        .map((QuerySnapshot query) {
      List<BodyWeightTraining> retVal = [];
      for (var elem in query.docs) {
        retVal.add(BodyWeightTraining.fromSnap(elem));
      }
      return retVal;
    }));
  }

  getSitUps(String workoutType, String title) async {
    String uid = firebaseAuth.currentUser!.uid;
    _sitUps.bindStream(firestore
        .collection('users')
        .doc(uid)
        .collection('workouts')
        .doc(workoutType)
        .collection(title)
        .snapshots()
        .map((QuerySnapshot query) {
      List<BodyWeightTraining> retVal = [];
      for (var elem in query.docs) {
        retVal.add(BodyWeightTraining.fromSnap(elem));
      }
      return retVal;
    }));
  }

  getRunning(String workoutType, String title) async {
    String uid = firebaseAuth.currentUser!.uid;
    _running.bindStream(firestore
        .collection('users')
        .doc(uid)
        .collection('workouts')
        .doc(workoutType)
        .collection(title)
        .snapshots()
        .map((QuerySnapshot query) {
      List<Cardio> retVal = [];
      for (var elem in query.docs) {
        retVal.add(Cardio.fromSnap(elem));
      }
      return retVal;
    }));
  }

  getSwimming(String workoutType, String title) async {
    String uid = firebaseAuth.currentUser!.uid;
    _swimming.bindStream(firestore
        .collection('users')
        .doc(uid)
        .collection('workouts')
        .doc(workoutType)
        .collection(title)
        .snapshots()
        .map((QuerySnapshot query) {
      List<Cardio> retVal = [];
      for (var elem in query.docs) {
        retVal.add(Cardio.fromSnap(elem));
      }
      return retVal;
    }));
  }

  getCycling(String workoutType, String title) async {
    String uid = firebaseAuth.currentUser!.uid;
    _cycling.bindStream(firestore
        .collection('users')
        .doc(uid)
        .collection('workouts')
        .doc(workoutType)
        .collection(title)
        .snapshots()
        .map((QuerySnapshot query) {
      List<Cardio> retVal = [];
      for (var elem in query.docs) {
        retVal.add(Cardio.fromSnap(elem));
      }
      return retVal;
    }));
  }

  saveWorkout(String workoutType, String title, String description) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;
      var allDocs = await firestore
          .collection('users')
          .doc(uid)
          .collection('workouts')
          .get();
      int len = allDocs.docs.length;

      WorkoutData workoutData = WorkoutData(
        uid: uid,
        id: title,
        workoutType: workoutType,
        title: title,
        description: description,
      );

      await firestore
          .collection('users')
          .doc(uid)
          .collection('workouts')
          .doc(workoutType)
          .set(
            workoutData.toJson(),
          );
    } catch (e) {
      Get.snackbar(
        'Error Uploading workout data',
        e.toString(),
      );
    }
  }

  saveBodyWeightSummary(String workoutType, String title, String description,
      int sets, int reps, int restTime, String workoutTime) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;
      var allDocs = await firestore
          .collection('users')
          .doc(uid)
          .collection('workouts')
          .doc(workoutType)
          .collection(title)
          .get();
      int len = allDocs.docs.length;

      BodyWeightTraining weightTraining = BodyWeightTraining(
        uid: uid,
        id: title,
        workoutType: workoutType,
        title: title,
        description: description,
        sets: sets,
        reps: reps,
        restTime: restTime,
        workoutTime: workoutTime,
      );

      await firestore
          .collection('users')
          .doc(uid)
          .collection('workouts')
          .doc(workoutType)
          .collection(title)
          .doc(title + 'workout $len')
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
          .collection('workouts')
          .doc(workoutType)
          .collection(title)
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
          .collection('workouts')
          .doc(workoutType)
          .collection(title)
          .doc(title + 'workout $len')
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
          .collection('workouts')
          .doc(workoutType)
          .collection(title)
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
          .collection('workouts')
          .doc(workoutType)
          .collection(title)
          .doc(title + 'workout $len')
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
