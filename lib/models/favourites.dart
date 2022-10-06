import 'package:cloud_firestore/cloud_firestore.dart';

class Favourites {
  String username;
  String uid;
  String id;
  List likes;
  int commentCount;
  int shareCount;
  String workoutType;
  String title;
  String description;
  String sets;
  String reps;
  String time;
  String videoUrl;
  String thumbnail;
  String profilePhoto;

  Favourites({
    required this.username,
    required this.uid,
    required this.id,
    required this.likes,
    required this.commentCount,
    required this.shareCount,
    required this.workoutType,
    required this.title,
    required this.description,
    required this.sets,
    required this.reps,
    required this.time,
    required this.videoUrl,
    required this.profilePhoto,
    required this.thumbnail,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "profilePhoto": profilePhoto,
        "id": id,
        "likes": likes,
        "commentCount": commentCount,
        "shareCount": shareCount,
        "workoutType": workoutType,
        "title": title,
        "description": description,
        "sets": sets,
        "reps": reps,
        "time": time,
        "videoUrl": videoUrl,
        "thumbnail": thumbnail,
      };

  static Favourites fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Favourites(
      username: snapshot['username'],
      uid: snapshot['uid'],
      id: snapshot['id'],
      likes: snapshot['likes'],
      commentCount: snapshot['commentCount'],
      shareCount: snapshot['shareCount'],
      workoutType: snapshot['workoutType'],
      title: snapshot['title'],
      description: snapshot['description'],
      sets: snapshot['sets'],
      reps: snapshot['reps'],
      time: snapshot['time'],
      videoUrl: snapshot['videoUrl'],
      profilePhoto: snapshot['profilePhoto'],
      thumbnail: snapshot['thumbnail'],
    );
  }
}
