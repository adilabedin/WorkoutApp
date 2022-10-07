import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:workout_app/constants.dart';
import 'package:workout_app/controllers/favourite_workouts_controller.dart';
import 'package:workout_app/controllers/profile_controller.dart';
import 'package:workout_app/controllers/video_controller.dart';
import 'package:workout_app/views/screens/home_screen.dart';
import 'package:workout_app/views/screens/messages_screen.dart';
import 'package:workout_app/views/screens/workout_screens/favourite_workout_video_screen.dart';
import 'package:workout_app/views/screens/workout_screens/myForm.dart';
import 'package:workout_app/views/screens/video_screens/video_screen.dart';
import 'package:workout_app/views/screens/workout_screens/workout_data_screen.dart';
import 'package:workout_app/views/widgets/video_player_item.dart';

class FavouriteWorkoutsScreen extends StatefulWidget {
  final String uid;
  const FavouriteWorkoutsScreen({
    Key? key,
    required this.uid,
  }) : super(key: key);

  @override
  State<FavouriteWorkoutsScreen> createState() =>
      _FavouriteWorkoutsScreenState();
}

class _FavouriteWorkoutsScreenState extends State<FavouriteWorkoutsScreen> {
  final FavouriteWorkoutsController favouriteWorkoutsController =
      Get.put(FavouriteWorkoutsController());
  final VideoController videoController = Get.put(VideoController());

  @override
  void initState() {
    super.initState();
    favouriteWorkoutsController.updateUserId(widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavouriteWorkoutsController>(
        init: FavouriteWorkoutsController(),
        builder: (controller) {
          if (controller.user.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black12,
              title: Text(
                controller.user['name'] + "'s" + " Favourites",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    Get.to(MyForm());
                                  },
                                  child: Text('Quick Workout'))
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          // video list
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.user['thumbnails'].length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 1,
                              crossAxisSpacing: 5,
                            ),
                            itemBuilder: (context, index) {
                              String thumbnail =
                                  controller.user['thumbnails'][index];
                              return InkWell(
                                child: CachedNetworkImage(
                                  imageUrl: thumbnail,
                                  fit: BoxFit.cover,
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return FavouriteWorkoutVideoScreen();
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
