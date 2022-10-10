import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:get/get.dart';
import 'package:workout_app/constants.dart';
import 'package:workout_app/controllers/favourite_workouts_controller.dart';
import 'package:workout_app/controllers/video_controller.dart';
import 'package:workout_app/views/screens/workout_video_screen/workout_interaction/comments/comment_screen.dart';
import 'package:workout_app/views/screens/search_screen.dart';
import 'package:workout_app/views/screens/workout_video_screen/workout_interaction/comments/comments_link.dart';
import 'package:workout_app/views/screens/workout_video_screen/workout_interaction/favourite_workout.dart';
import 'package:workout_app/views/screens/workout_video_screen/workout_interaction/like_workout.dart';
import 'package:workout_app/views/screens/workout_video_screen/workout_interaction/profile_link.dart';
import 'package:workout_app/views/screens/workout_video_screen/workout_interaction/video_info.dart';
import 'package:workout_app/views/screens/workout_video_screen/workout_interaction/workout_details.dart';
import 'package:workout_app/views/widgets/video_player_item.dart';

class FavouriteWorkoutVideoScreen extends StatelessWidget {
  FavouriteWorkoutVideoScreen({
    Key? key,
    required this.videoUrl,
    required this.index,
  }) : super(key: key);

  final FavouriteWorkoutsController favouriteWorkoutsController =
      Get.put(FavouriteWorkoutsController());
  final FavouriteWorkoutsController videoController =
      Get.put(FavouriteWorkoutsController());
  final String videoUrl;
  final int index;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final data = videoController.favList[index];

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() => SearchScreen());
                },
                icon: Icon(Icons.search, size: 30))
          ],
        ),
        body: Stack(
          children: [
            VideoPlayerItem(
              videoUrl: videoUrl,
            ),
            Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      VideoInfo(data: data),
                      Container(
                        width: 100,
                        margin: EdgeInsets.only(top: size.height / 40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ProfileLink(
                              profilePhoto: data.profilePhoto,
                            ),
                            // LikeWorkout(
                            //     videoController: videoController, data: data),
                            // FavouriteWorkout(
                            //     videoController: videoController, data: data),
                            WorkoutDetails(data: data),
                            Comments_Link(data: data),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
