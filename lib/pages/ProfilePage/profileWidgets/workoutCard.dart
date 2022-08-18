import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  final String? title;
  final String? desc;
  WorkoutCard({this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 32.0,
        horizontal: 24.0,
      ),
      margin: EdgeInsets.only(
        bottom: 20.0,
      ),
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? "(unamed workout)",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                top: 10.0,
              ),
              child: Text(
                desc ?? "Workout",
              ))
        ],
      ),
    );
  }
}
