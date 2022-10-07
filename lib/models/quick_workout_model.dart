import 'package:cloud_firestore/cloud_firestore.dart';

class QuickWorkoutModel {
  String workoutType;
  String title;
  int sets;
  int reps;
  int restTime;

  QuickWorkoutModel({
    required this.workoutType,
    required this.title,
    required this.sets,
    required this.reps,
    required this.restTime,
  });

  Map<String, dynamic> toJson() => {
        "workoutType": workoutType,
        "title": title,
        "sets": sets,
        "reps": reps,
        "restTime": restTime,
      };

  static QuickWorkoutModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return QuickWorkoutModel(
      workoutType: snapshot['workoutType'],
      title: snapshot['title'],
      sets: snapshot['sets'],
      reps: snapshot['reps'],
      restTime: snapshot['restTime'],
    );
  }
}
