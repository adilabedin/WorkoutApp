import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:workout_app/constants.dart';
import 'package:workout_app/controllers/upload_video_controller.dart';
import 'package:workout_app/views/screens/confirm_screen.dart';
import 'package:workout_app/views/widgets/buildDescription.dart';
import 'package:workout_app/views/widgets/buildTitle.dart';
import 'package:get/get.dart';

class AddVideoScreen extends StatelessWidget {
  AddVideoScreen({Key? key}) : super(key: key);
  TextEditingController _songController = TextEditingController();
  TextEditingController _captionController = TextEditingController();
  final setController = TextEditingController();
  final repController = TextEditingController();
  final timeController = TextEditingController();

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
    var widget;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Flexible(
              child: Column(
                children: [
                  InkWell(
                    onTap: () => showOptionsDialog(context),
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 190,
                      height: 50,
                      decoration: BoxDecoration(color: buttonColor),
                      child: Text(
                        'Add Video',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
                            const SizedBox(width: 7),
                            buildNumber('Reps', repController),
                            const SizedBox(width: 7),
                            buildNumber('Time', timeController),
                            const SizedBox(width: 7),
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
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
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
