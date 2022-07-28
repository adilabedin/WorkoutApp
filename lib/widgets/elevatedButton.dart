import 'package:flutter/material.dart';
import '../page/home.dart';

Widget editButton(String buttonName, context, setState) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: Colors.blue,
    ),
    onPressed: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => Home(),
        ),
      );
      setState(() {
        var buttonState = 'clicked';
      });
    },
    child: Text(buttonName),
  );
}
