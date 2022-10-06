import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:workout_app/constants.dart';
import 'package:workout_app/models/favourites.dart';
import 'package:workout_app/models/video.dart';

class FavouriteController extends GetxController {
  final Rx<List<Favourites>> _favouriteList = Rx<List<Favourites>>([]);

  List<Favourites> get favouriteList => _favouriteList.value;
  List<Favourites> retVal = [];

  favouriteVideo(String id) async {
    DocumentSnapshot doc = await firestore.collection('videos').doc(id).get();
    var uid = authController.user.uid;
    if ((doc.data()! as dynamic)['likes'].contains(uid)) {
      await firestore.collection('videos').doc(id).update({
        'likes': FieldValue.arrayRemove([uid]),
      });
      _favouriteList.bindStream(
          firestore.collection('videos').snapshots().map((QuerySnapshot query) {
        for (var elem in query.docs) {
          retVal.remove(Favourites.fromSnap(elem));
        }
        return retVal;
      }));
    } else {
      await firestore.collection('videos').doc(id).update({
        'likes': FieldValue.arrayUnion([uid]),
      });
      _favouriteList.bindStream(
          firestore.collection('videos').snapshots().map((QuerySnapshot query) {
        for (var elem in query.docs) {
          retVal.add(Favourites.fromSnap(elem));
        }

        return retVal;
      }));
    }
  }
}
