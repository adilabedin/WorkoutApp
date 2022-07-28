import 'package:flutter/material.dart';

import '../widgets/elevatedButton.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Workout App'),
      ),
      body: Container(
        child: Container(
          margin: EdgeInsets.all(10),
          color: Colors.green,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: const Alignment(0, -1),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: Colors.black),
                  ),
                  child: Row(
                    children: [
                      Text('workout name'),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0, -.8),
                child: Container(
                  child: Row(
                    children: [
                      Text('Additional Info'),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0, -.6),
                child: Container(
                  child: Row(
                    children: [
                      Text('Description'),
                      editButton('edit', context, setState)
                    ],
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0, -.4),
                child: Container(
                  child: Row(
                    children: [
                      Text('URL'),
                      SizedBox(width: 50),
                      editButton('edit', context, setState)
                    ],
                  ),
                ),
              ),
              Align(
                child: Container(
                  child: Row(
                    children: [
                      Text('Sets'),
                      editButton('edit', context, setState)
                    ],
                  ),
                ),
              ),
              editButton('save workout', context, setState)
            ],
          ),
        ),
      ),
    );
  }
}

// child: Align(
//   alignment: Alignment.topLeft,
//   child: Container(
//     decoration: BoxDecoration(border: Border.all()),
//     child: Stack(
//       children: <Widget>[
//         Container(
//           padding: EdgeInsets.all(8.0),
//           child: Row(
//             children: [
//               Text('Workout Name'),
//             ],
//           ),
//         ),


