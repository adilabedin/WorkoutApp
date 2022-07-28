import 'package:flutter/material.dart';

class Chest extends StatefulWidget {
  Chest({Key? key}) : super(key: key);

  @override
  State<Chest> createState() => _ChestState();
}

class _ChestState extends State<Chest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('bench press'),
      ),
    );
  }
}
