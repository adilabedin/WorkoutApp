import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CardioWorkoutCard extends StatelessWidget {
  CardioWorkoutCard({
    required this.title,
    required this.description,
    required this.lapDistance,
    required this.laps,
  });

  String title;
  String description;
  int lapDistance;
  int laps;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.fitness_center_outlined),
              title: Text(title),
              subtitle: Text('lap distance: ' +
                  lapDistance.toString() +
                  'm '
                      ' laps: ' +
                  laps.toString()),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text('Start Workout'),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Read Description'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
