import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:workout_app/models/workoutDetails.dart';
import 'package:workout_app/views/screens/workout_screens/quick_workout_screen.dart';
import 'package:workout_app/views/widgets/text_input_field.dart';
import 'package:workout_app/views/widgets/workoutType.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  _MyFormState() {
    _electedValue = list[0];
  }

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _setController = TextEditingController();
  final _repController = TextEditingController();
  final _restTimeController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _setController.dispose();
    _repController.dispose();
    _restTimeController.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  WorkoutTypeDetails workoutType = WorkoutTypeDetails();

  final list = ['Body-Weight-Training', 'Weight-Training', 'cardio'];
  String? _electedValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quick Workout'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(children: [
                        DropdownButtonFormField(
                            value: _electedValue,
                            items: list
                                .map((e) => DropdownMenuItem(
                                      child: Text(e),
                                      value: e,
                                    ))
                                .toList(),
                            onChanged: (val) {
                              setState(() {
                                _electedValue = val as String;
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
                                controller: _restTimeController,
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
                                workoutType.workoutType = _electedValue!;

                                Get.to(() => QuickWorkoutScreen(
                                    workoutType: workoutType.workoutType,
                                    workoutName: _titleController.text,
                                    description: _descriptionController.text,
                                    sets: int.parse(_setController.text),
                                    reps: int.parse(_repController.text),
                                    restTime:
                                        int.parse(_restTimeController.text)));
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
      ),
    );
  }
}
