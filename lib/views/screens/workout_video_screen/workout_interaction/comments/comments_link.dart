import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:workout_app/views/screens/workout_video_screen/workout_interaction/comments/comment_screen.dart';

class Comments_Link extends StatelessWidget {
  const Comments_Link({Key? key, required this.data}) : super(key: key);

  final data;
  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
