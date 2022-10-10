import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:workout_app/constants.dart';
import 'package:workout_app/models/workout.dart';

class WorkoutDataController extends GetxController {
  saveWorkout(String workoutType, String title, String description, String sets,
      String reps, int restTime, String workoutTime) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;
      DocumentSnapshot userDoc =
          await firestore.collection('users').doc(uid).get();
      var allDocs = await firestore.collection('workouts').get();
      int len = allDocs.docs.length;

      Workout video = Workout(
        uid: uid,
        id: "Workout $len",
        workoutType: workoutType,
        title: title,
        description: description,
        sets: sets,
        reps: reps,
        restTime: restTime,
        workoutTime: workoutTime,
      );

      await firestore.collection('workouts').doc('Workout $len').set(
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
