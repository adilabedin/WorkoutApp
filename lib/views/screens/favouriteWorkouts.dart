import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:workout_app/constants.dart';
import 'package:workout_app/controllers/favourite_controller.dart';
import 'package:workout_app/controllers/video_controller.dart';
import 'package:workout_app/views/screens/WorkoutPage/createWorkout.dart';
import 'package:workout_app/views/screens/WorkoutPage/quickWorkout.dart';
import 'package:workout_app/views/screens/comment_screen.dart';
import 'package:workout_app/views/screens/search_screen.dart';
import 'package:workout_app/views/widgets/video_player_item.dart';

class FavouriteWorkouts extends StatelessWidget {
  FavouriteWorkouts({super.key});

  final FavouriteController favouriteController =
      Get.put(FavouriteController());
  buildProfile(String profilePhoto) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Stack(children: [
        Positioned(
          left: 5,
          child: Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image(
                image: NetworkImage(profilePhoto),
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(SearchScreen());
              },
              icon: Icon(Icons.search, size: 30))
        ],
      ),
      body: Obx(() {
        return PageView.builder(
          itemCount: favouriteController.favouriteList.length,
          controller: PageController(initialPage: 0, viewportFraction: 1),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final data = favouriteController.favouriteList[index];
            return Stack(
              children: [
                VideoPlayerItem(
                  videoUrl: data.videoUrl,
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
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(
                                left: 20,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    data.username,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    data.title,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.music_note,
                                        size: 15,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        data.description,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 100,
                            margin: EdgeInsets.only(top: size.height / 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                buildProfile(
                                  data.profilePhoto,
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () => favouriteController
                                          .favouriteVideo(data.id),
                                      child: Icon(
                                        Icons.favorite,
                                        size: 40,
                                        color: data.likes.contains(
                                                authController.user.uid)
                                            ? Colors.red
                                            : Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 7),
                                    Text(
                                      data.likes.length.toString(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () => showDialog(
                                          context: context,
                                          builder: ((context) => AlertDialog(
                                                title: Text(data.title),
                                                content: Column(
                                                  children: [
                                                    Text(data.workoutType),
                                                    Text(data.description),
                                                    Row(
                                                      children: [
                                                        Text(data.sets),
                                                        Text(data.reps),
                                                        Text(data.time),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                actions: [
                                                  InkWell(
                                                    onTap: () =>
                                                        favouriteController
                                                            .favouriteVideo(
                                                                data.id),
                                                    child: Icon(
                                                      Icons
                                                          .fitness_center_outlined,
                                                      size: 40,
                                                      color: data.likes
                                                              .contains(
                                                                  authController
                                                                      .user.uid)
                                                          ? Colors.red
                                                          : Colors.white,
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () =>
                                                        favouriteController
                                                            .favouriteVideo(
                                                                data.id),
                                                    child: Icon(
                                                      Icons.favorite,
                                                      size: 40,
                                                      color: data.likes
                                                              .contains(
                                                                  authController
                                                                      .user.uid)
                                                          ? Colors.red
                                                          : Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ))),
                                      child: const Icon(
                                        Icons.file_open,
                                        size: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 7),
                                    Text(
                                      ('Info'),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () => Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => CommentScreen(
                                            id: data.id,
                                          ),
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.comment,
                                        size: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 7),
                                    Text(
                                      data.commentCount.toString(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: const Icon(
                                        Icons.reply,
                                        size: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 7),
                                    Text(
                                      data.shareCount.toString(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      }),
    );
  }
}
