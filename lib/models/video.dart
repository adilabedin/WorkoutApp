import 'package:cloud_firestore/cloud_firestore.dart';

class Video {
  String username;
  String uid;
  String id;
  List likes;
  List favourites;
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

  Video({
    required this.username,
    required this.uid,
    required this.id,
    required this.likes,
    required this.favourites,
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
        "favourites": favourites,
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

  static Video fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Video(
      username: snapshot['username'],
      uid: snapshot['uid'],
      id: snapshot['id'],
      likes: snapshot['likes'],
      favourites: snapshot['favourites'],
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
