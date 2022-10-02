import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_app/controllers/upload_video_controller.dart';
import 'package:workout_app/views/widgets/buildDescription.dart';
import 'package:workout_app/views/widgets/buildTitle.dart';
import 'package:workout_app/views/widgets/text_input_field.dart';
import 'package:video_player/video_player.dart';
import 'package:workout_app/views/widgets/buildNumber.dart';

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
  late VideoPlayerController controller;
  TextEditingController _songController = TextEditingController();
  TextEditingController _captionController = TextEditingController();
  final setController = TextEditingController();
  final repController = TextEditingController();
  final timeController = TextEditingController();

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
                  BuildTitle(),
                  const SizedBox(
                    height: 10,
                  ),
                  BuildDescription(),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      buildNumber('Sets', setController),
                      const SizedBox(width: 24),
                      buildNumber('Reps', repController),
                      const SizedBox(width: 24),
                      buildNumber('Time', timeController),
                      const SizedBox(width: 24),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () => uploadVideoController.uploadVideo(
                          _songController.text,
                          _captionController.text,
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

  Widget buildNumber(name, numberController) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            SizedBox(
              width: 80,
              height: 80,
              child: TextField(
                controller: numberController,
                decoration: InputDecoration(
                  hintText: 'Enter number...',
                  hintStyle: TextStyle(color: Colors.blue),
                  filled: true,
                  fillColor: Colors.black,
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(color: Colors.blue),
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
      );
}
