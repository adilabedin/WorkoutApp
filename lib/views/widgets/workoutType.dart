import 'package:flutter/material.dart';

const List<String> list = <String>['Weight-Training', 'Cardio', 'Yoga'];

class WorkoutType extends StatefulWidget {
  const WorkoutType({super.key});
  @override
  State<WorkoutType> createState() => _WorkoutTypeState();
}

class _WorkoutTypeState extends State<WorkoutType> {
  static String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value!;
            print(value);
          });
        },
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
