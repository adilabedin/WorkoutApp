import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_app/controllers/upload_video_controller.dart';
import 'package:workout_app/models/workoutDetails.dart';
import 'package:workout_app/views/screens/home_screen.dart';
import 'package:workout_app/views/screens/workout_video_screen/video_screen.dart';

import 'package:workout_app/views/widgets/text_input_field.dart';
import 'package:video_player/video_player.dart';
import 'package:workout_app/views/widgets/workoutType.dart';

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
  _ConfirmScreenState() {
    _selectedValue = list[0];
  }
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

  final _formKey = GlobalKey<FormState>();
  WorkoutTypeDetails workoutType = WorkoutTypeDetails();

  final list = ['Body-Weight-Training', 'Weight-Training', 'cardio'];

  String? _selectedValue = '';
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
                  Form(
                    key: _formKey,
                    child: Column(children: [
                      DropdownButtonFormField(
                          value: _selectedValue,
                          items: list
                              .map((e) => DropdownMenuItem(
                                    child: Text(e),
                                    value: e,
                                  ))
                              .toList(),
                          onChanged: (val) {
                            setState(() {
                              _selectedValue = val as String;
                            });
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      TextInputField(
                        controller: _titleController,
                        labelText: 'Workout Name',
                        lines: 1,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextInputField(
                        controller: _descriptionController,
                        labelText: 'description',
                        lines: null,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 120,
                            child: TextInputField(
                              controller: _setController,
                              labelText: 'Sets/Distance',
                              lines: 1,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 120,
                            child: TextInputField(
                                controller: _repController,
                                labelText: 'laps/Reps',
                                lines: 1),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 120,
                            child: TextInputField(
                              controller: _timeController,
                              labelText: 'Rest time',
                              lines: 1,
                            ),
                          ),
                          const SizedBox(width: 24),
                        ],
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              workoutType.workoutType = _selectedValue!;
                              uploadVideoController.uploadVideo(
                                  workoutType.workoutType,
                                  _titleController.text,
                                  _descriptionController.text,
                                  _setController.text,
                                  _repController.text,
                                  _timeController.text,
                                  widget.videoPath);
                              Get.to(() => HomeScreen());
                            }
                          },
                          child: const Text(
                            'Share!',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ))
                    ]),
                  ),
                ]),
          )
        ],
      ),
    ));
  }
}
