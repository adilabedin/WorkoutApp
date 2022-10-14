import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:workout_app/constants.dart';
import 'package:workout_app/controllers/video_controller.dart';
import 'package:workout_app/controllers/workout_data_controller.dart';

class FavouriteWorkout extends StatelessWidget {
  const FavouriteWorkout(
      {Key? key,
      required this.videoController,
      required this.data,
      required this.workoutController})
      : super(key: key);

  final WorkoutDataController workoutController;
  final VideoController videoController;
  final data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => videoController.favouriteVideo(
            data.id,
          ),
          child: Icon(
            Icons.favorite,
            size: 40,
            color: data.favourites.contains(authController.user.uid)
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
    );
  }
}
