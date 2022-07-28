import 'package:flutter/material.dart';
import 'package:workout_app/page/calves.dart';
import 'package:workout_app/page/Hamstrings.dart';
import 'package:workout_app/page/quads.dart';
import 'package:workout_app/page/abs.dart';
import 'package:workout_app/page/arms.dart';
import 'package:workout_app/page/back.dart';
import 'package:workout_app/page/chest.dart';
import 'package:workout_app/widgets/elevatedButton.dart';

import 'abs.dart';

class Workouts extends StatefulWidget {
  Workouts({Key? key}) : super(key: key);

  @override
  State<Workouts> createState() => _WorkoutsState();
}

class _WorkoutsState extends State<Workouts> {
  String buttonName = 'click';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Start a Workout')),
        body: Center(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/ronaldosiuu.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Align(
                    alignment: const Alignment(0.0, -0.3),
                    child: editButton('Chest', context, setState)),
                Align(
                    alignment: const Alignment(0.7, 0.0),
                    child: editButton('Arms', context, setState)),
                Align(
                    alignment: const Alignment(0.5, -0.6),
                    child: editButton('Back', context, setState)),
                Align(
                    alignment: const Alignment(0.0, 0.1),
                    child: editButton('Abs', context, setState)),
                Align(
                    alignment: const Alignment(-0.3, 0.6),
                    child: editButton('Quads', context, setState)),
                Align(
                    alignment: const Alignment(0.9, 0.6),
                    child: editButton('Hamstrings', context, setState)),
                Align(
                    alignment: const Alignment(-0.5, 0.95),
                    child: editButton('Calves', context, setState)),
              ],
            ),
          ),
        ),
      );
}
