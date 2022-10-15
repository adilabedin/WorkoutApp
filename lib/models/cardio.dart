import 'package:cloud_firestore/cloud_firestore.dart';

class Cardio {
  String uid;
  String id;
  String workoutType;
  String title;
  String description;
  int laps;
  int lapDistance;
  int restTime;
  String workoutTime;

  Cardio({
    required this.uid,
    required this.id,
    required this.workoutType,
    required this.title,
    required this.description,
    required this.laps,
    required this.lapDistance,
    required this.restTime,
    required this.workoutTime,
  });

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "id": id,
        "workoutType": workoutType,
        "title": title,
        "description": description,
        "lapDistance": lapDistance,
        "laps": laps,
        "restTime": restTime,
        "workoutTime": workoutTime
      };

  static Cardio fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Cardio(
        uid: snapshot['uid'],
        id: snapshot['id'],
        workoutType: snapshot['workoutType'],
        title: snapshot['title'],
        description: snapshot['description'],
        lapDistance: snapshot['lapDistance'],
        laps: snapshot['laps'],
        restTime: snapshot['restTime'],
        workoutTime: snapshot['workoutTime']);
  }
}
