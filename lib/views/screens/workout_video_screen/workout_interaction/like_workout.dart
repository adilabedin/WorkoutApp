import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:workout_app/constants.dart';
import 'package:workout_app/controllers/video_controller.dart';

class LikeWorkout extends StatelessWidget {
  const LikeWorkout(
      {Key? key, required this.videoController, required this.data})
      : super(key: key);

  final VideoController videoController;
  final data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => videoController.likeVideo(data.id),
          child: Icon(
            Icons.thumb_up,
            size: 40,
            color: data.likes.contains(authController.user.uid)
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
    );
  }
}
