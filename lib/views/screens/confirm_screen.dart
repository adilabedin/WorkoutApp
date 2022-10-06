import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_app/controllers/upload_video_controller.dart';
import 'package:workout_app/views/widgets/buildDescription.dart';
import 'package:workout_app/views/widgets/buildTitle.dart';
import 'package:workout_app/views/widgets/text_input_field.dart';
import 'package:video_player/video_player.dart';

const List<String> list = <String>['Weight-Training', 'Cardio', 'Yoga'];

class ConfirmScreen extends StatefulWidget {
  final File videoFile;
  final String videoPath;
  const ConfirmScreen({
    Key? key,
    required this.videoFile,
    required this.videoPath,
  }) : super(key: key);

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  static String dropdownValue = list.first;
  late VideoPlayerController controller;
  TextEditingController _workoutTypeController = TextEditingController();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _setController = TextEditingController();
  TextEditingController _repController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  UploadVideoController uploadVideoController =
      Get.put(UploadVideoController());

  @override
  void initState() {
    super.initState();
    setState(() {
      controller = VideoPlayerController.file(widget.videoFile);
    });
    controller.initialize();
    controller.play();
    controller.setVolume(1);
    controller.setLooping(true);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.5,
              child: VideoPlayer(controller),
            ),
            const SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width - 20,
                    child: TextInputField(
                      controller: _workoutTypeController,
                      labelText: 'Workout Type',
                      icon: Icons.music_note,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width - 20,
                    child: TextInputField(
                      controller: _titleController,
                      labelText: 'Workout Name',
                      icon: Icons.music_note,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width - 20,
                    child: TextInputField(
                      controller: _descriptionController,
                      labelText: 'description',
                      icon: Icons.closed_caption,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        width: 100,
                        child: TextInputField(
                          controller: _setController,
                          labelText: 'Sets',
                          icon: Icons.closed_caption,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        width: 100,
                        child: TextInputField(
                          controller: _repController,
                          labelText: 'Reps',
                          icon: Icons.music_note,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        width: 100,
                        child: TextInputField(
                          controller: _timeController,
                          labelText: 'time',
                          icon: Icons.closed_caption,
                        ),
                      ),
                      const SizedBox(width: 24),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () => uploadVideoController.uploadVideo(
                          _workoutTypeController.text,
                          _titleController.text,
                          _descriptionController.text,
                          _setController.text,
                          _repController.text,
                          _timeController.text,
                          widget.videoPath),
                      child: const Text(
                        'Share!',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
