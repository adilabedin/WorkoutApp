import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:path/path.dart';
import 'package:workout_app/views/screens/workout_screens/quick_workout_screen.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  var _title;
  var _description;
  var _sets;
  var _reps;
  var _restTime;

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _setController = TextEditingController();
  final _repController = TextEditingController();
  final _restTimeController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _titleController.addListener(_updateText);
    _descriptionController.addListener(_updateText);
    _setController.addListener(_updateText);
    _repController.addListener(_updateText);
    _restTimeController.addListener(_updateText);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _setController.dispose();
    _repController.dispose();
    _restTimeController.dispose();
  }

  void _updateText() {
    setState(() {
      _title = _titleController.text;
      _description = _descriptionController.text;
      _sets = _setController.text;
      _reps = _repController.text;
      _restTime = _restTimeController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyForm'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                  labelText: 'Workout Name', border: OutlineInputBorder()),
            ),
            Text("Product Name is ${_titleController.text}"),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _descriptionController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                  labelText: 'Description', border: OutlineInputBorder()),
            ),
            Text("Product Name is ${_descriptionController.text}"),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 80,
                  height: 80,
                  child: TextFormField(
                    controller: _setController,
                    decoration: InputDecoration(
                      hintText: 'Sets...',
                      hintStyle: TextStyle(color: Colors.blue),
                      filled: true,
                      fillColor: Colors.black,
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(color: Colors.blue),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 20),
                SizedBox(
                  width: 80,
                  height: 80,
                  child: TextFormField(
                    controller: _repController,
                    decoration: InputDecoration(
                      hintText: 'Reps...',
                      hintStyle: TextStyle(color: Colors.blue),
                      filled: true,
                      fillColor: Colors.black,
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(color: Colors.blue),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 20),
                SizedBox(
                  width: 80,
                  height: 80,
                  child: TextFormField(
                    controller: _restTimeController,
                    decoration: InputDecoration(
                      hintText: 'Rest...',
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
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return QuickWorkoutScreen(
                          workoutName: _titleController.text,
                          description: _descriptionController.text,
                          sets: _setController.text,
                          reps: _repController.text,
                          restTime: int.parse(_restTimeController.text));
                    },
                  ),
                );
              },
              child: Text('Continue'),
            )
          ],
        ),
      ),
    );
  }
}
