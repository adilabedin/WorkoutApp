import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_app/controllers/video_controller.dart';
import 'package:workout_app/controllers/workout_data_controller.dart';
import 'package:workout_app/views/screens/workout_video_screen/workout_interaction/video_info.dart';
import 'package:workout_app/views/screens/search_screen.dart';
import 'package:workout_app/views/screens/workout_video_screen/workout_interaction/comments/comments_link.dart';
import 'package:workout_app/views/screens/workout_video_screen/workout_interaction/favourite_workout.dart';
import 'package:workout_app/views/screens/workout_video_screen/workout_interaction/like_workout.dart';
import 'package:workout_app/views/screens/workout_video_screen/workout_interaction/profile_link.dart';
import 'package:workout_app/views/screens/workout_video_screen/workout_interaction/workout_details.dart';
import 'package:workout_app/views/widgets/video_player_item.dart';

class VideoScreen extends StatelessWidget {
  VideoScreen({Key? key}) : super(key: key);

  final VideoController videoController = Get.put(VideoController());
  final WorkoutDataController workoutController =
      Get.put(WorkoutDataController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => SearchScreen());
              },
              icon: Icon(Icons.search, size: 30))
        ],
      ),
      body: Obx(() {
        return PageView.builder(
          itemCount: videoController.videoList.length,
          controller: PageController(initialPage: 0, viewportFraction: 1),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final data = videoController.videoList[index];
            return Stack(children: [
              VideoPlayerItem(
                videoUrl: data.videoUrl,
              ),
              Column(children: [
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
                            LikeWorkout(
                                videoController: videoController, data: data),
                            FavouriteWorkout(
                                videoController: videoController,
                                data: data,
                                workoutController: workoutController),
                            WorkoutDetails(
                                data: data,
                                workoutController: workoutController),
                            Comments_Link(data: data),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ])
            ]);
          },
        );
      }),
    );
  }
}
