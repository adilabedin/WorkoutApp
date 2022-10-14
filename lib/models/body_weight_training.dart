import 'package:cloud_firestore/cloud_firestore.dart';

class BodyWeightTraining {
  String uid;
  String id;
  String workoutType;
  String title;
  String description;
  String sets;
  String reps;
  int restTime;
  int workoutWeight;
  String workoutTime;

  BodyWeightTraining({
    required this.uid,
    required this.id,
    required this.workoutType,
    required this.title,
    required this.description,
    required this.sets,
    required this.reps,
    required this.restTime,
    required this.workoutWeight,
    required this.workoutTime,
  });

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "id": id,
        "workoutType": workoutType,
        "title": title,
        "description": description,
        "sets": sets,
        "reps": reps,
        "restTime": restTime,
        "workoutWeight": workoutWeight,
        "workoutTime": workoutTime
      };

  static BodyWeightTraining fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return BodyWeightTraining(
        uid: snapshot['uid'],
        id: snapshot['id'],
        workoutType: snapshot['workoutType'],
        title: snapshot['title'],
        description: snapshot['description'],
        sets: snapshot['sets'],
        reps: snapshot['reps'],
        restTime: snapshot['restTime'],
        workoutWeight: snapshot['workoutWeight'],
        workoutTime: snapshot['workoutTime']);
  }
}
