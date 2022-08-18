import 'package:flutter/material.dart';
import 'package:workout_app/pages/HomePage/home.dart';

Widget editButton(String buttonName, context, setState) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: Colors.blue,
    ),
    onPressed: () {
      print("why arent you working");
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => Home(),
        ),
      );
      setState(() {});
    },
    child: Text(buttonName),
  );
}
