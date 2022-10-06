import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:workout_app/constants.dart';
import 'package:workout_app/models/favourites.dart';
import 'package:workout_app/models/video.dart';

class VideoController extends GetxController {
  final Rx<List<Video>> _videoList = Rx<List<Video>>([]);
  final Rx<List<Favourites>> _favouriteList = Rx<List<Favourites>>([]);

  List<Video> get videoList => _videoList.value;

  @override
  void onInit() {
    super.onInit();
    _videoList.bindStream(
        firestore.collection('videos').snapshots().map((QuerySnapshot query) {
      List<Video> retVal = [];
      for (var element in query.docs) {
        retVal.add(
          Video.fromSnap(element),
        );
      }
      return retVal;
    }));
  }

//   favouriteVideo(String id) async {
//     DocumentSnapshot doc = await firestore.collection('videos').doc(id).get();
//     var uid = authController.user.uid;
//     if ((doc.data()! as dynamic)['likes'].contains(uid)) {
//       await firestore.collection('videos').doc(id).update({
//         'likes': FieldValue.arrayRemove([uid]),
//       });
//     } else {
//       await firestore.collection('videos').doc(id).update({
//         'likes': FieldValue.arrayUnion([uid]),
//       });
//       _favouriteList.bindStream(firestore
//           .collection('videos')
//           .where(!'likes'.contains(uid))
//           .snapshots()
//           .map((QuerySnapshot query) {
//         List<Favourites> retVal = [];
//         for (var elem in query.docs) {
//           retVal.add(Favourites.fromSnap(elem));
//         }
//         return retVal;
//       }));
//     }
//   }
}
