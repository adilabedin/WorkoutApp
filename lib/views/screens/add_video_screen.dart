import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:workout_app/constants.dart';
import 'package:workout_app/controllers/upload_video_controller.dart';
import 'package:workout_app/views/screens/WorkoutPage/createWorkout.dart';
import 'package:workout_app/views/screens/confirm_screen.dart';
import 'package:get/get.dart';

class AddVideoScreen extends StatelessWidget {
  AddVideoScreen({Key? key}) : super(key: key);

  UploadVideoController uploadVideoController =
      Get.put(UploadVideoController());

  pickVideo(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ConfirmScreen(
            videoFile: File(video.path),
            videoPath: video.path,
          ),
        ),
      );
    }
  }

  showOptionsDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        children: [
          SimpleDialogOption(
            onPressed: () => pickVideo(ImageSource.gallery, context),
            child: Row(
              children: const [
                Icon(Icons.image),
                Padding(
                  padding: EdgeInsets.all(7.0),
                  child: Text(
                    'Gallery',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () => pickVideo(ImageSource.camera, context),
            child: Row(
              children: const [
                Icon(Icons.camera_alt),
                Padding(
                  padding: EdgeInsets.all(7.0),
                  child: Text(
                    'Camera',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () => Navigator.of(context).pop(),
            child: Row(
              children: const [
                Icon(Icons.cancel),
                Padding(
                  padding: EdgeInsets.all(7.0),
                  child: Text(
                    'Cancel',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Workout'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () => showOptionsDialog(context),
              child: Container(
                width: 190,
                height: 50,
                decoration: BoxDecoration(color: buttonColor),
                child: Center(
                  child: Text(
                    'Create with Video',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => Get.to(CreateWorkout()),
              child: Container(
                width: 190,
                height: 50,
                decoration: BoxDecoration(color: buttonColor),
                child: Center(
                  child: Text(
                    'Create without Video',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
