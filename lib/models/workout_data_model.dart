import 'package:cloud_firestore/cloud_firestore.dart';

class WorkoutData {
  String uid;
  String id;
  String workoutType;
  String title;
  String description;

  WorkoutData({
    required this.uid,
    required this.id,
    required this.workoutType,
    required this.title,
    required this.description,
  });

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "id": id,
        "workoutType": workoutType,
        "title": title,
        "description": description,
      };

  static WorkoutData fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return WorkoutData(
      uid: snapshot['uid'],
      id: snapshot['id'],
      workoutType: snapshot['workoutType'],
      title: snapshot['title'],
      description: snapshot['description'],
    );
  }
}
