import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:get/get.dart';
import 'package:workout_app/constants.dart';
import 'package:workout_app/controllers/favourite_workouts_controller.dart';
import 'package:workout_app/controllers/video_controller.dart';
import 'package:workout_app/views/screens/comment_screen.dart';
import 'package:workout_app/views/screens/search_screen.dart';
import 'package:workout_app/views/screens/workout_screens/quick_workout_screen.dart';
import 'package:workout_app/views/screens/workout_screens/workout_card_screen.dart';
import 'package:workout_app/views/widgets/video_player_item.dart';

class VideoScreen extends StatelessWidget {
  VideoScreen({Key? key}) : super(key: key);

  final VideoController videoController = Get.put(VideoController());

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
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(
                            left: 20,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        margin: EdgeInsets.only(top: size.height / 40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildProfile(
                              data.profilePhoto,
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () =>
                                      videoController.likeVideo(data.id),
                                  child: Icon(
                                    Icons.thumb_up,
                                    size: 40,
                                    color: data.likes
                                            .contains(authController.user.uid)
                                        ? Colors.blue
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
                                  onTap: () =>
                                      videoController.favouriteVideo(data.id),
                                  child: Icon(
                                    Icons.favorite,
                                    size: 40,
                                    color: data.favourites
                                            .contains(authController.user.uid)
                                        ? Colors.red
                                        : Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 7),
                                Text(
                                  data.favourites.length.toString(),
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
                                            title: Text(data.workoutType),
                                            content: Column(
                                              children: [
                                                Text(data.title),
                                                SizedBox(height: 20),
                                                Text(data.description),
                                                SizedBox(height: 20),
                                                Row(
                                                  children: [
                                                    Text(data.sets + ' SETS'),
                                                    SizedBox(width: 12),
                                                    Text(data.reps + ' REPS'),
                                                    SizedBox(width: 12),
                                                    Text(data.time +
                                                        ' Rest Time'),
                                                  ],
                                                )
                                              ],
                                            ),
                                            actions: [
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) {
                                                          return QuickWorkoutScreen(
                                                              workoutName:
                                                                  data.title,
                                                              description: data
                                                                  .description,
                                                              sets: data.sets,
                                                              reps: data.reps,
                                                              restTime:
                                                                  int.parse(data
                                                                      .time));
                                                        },
                                                      ),
                                                    );
                                                  },
                                                  child: Text('Try Workout')),
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
