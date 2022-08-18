import 'package:flutter/material.dart';
import 'package:workout_app/pages/Discover/discover.dart';
import 'package:workout_app/pages/HomePage/home.dart';
import 'package:workout_app/pages/ProfilePage/profile.dart';
import 'package:workout_app/pages/SettingsPage/settings.dart';
import 'package:workout_app/pages/ronaldo_siiupage/workouts.dart';

import 'pages/CreateWorkoutPage/createWorkout.dart';
import 'pages/InboxPage/inbox.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyAppExtension(),
    );
  }
}

class MyAppExtension extends StatefulWidget {
  const MyAppExtension({Key? key}) : super(key: key);

  @override
  State<MyAppExtension> createState() => _MyAppExtensionState();
}

class _MyAppExtensionState extends State<MyAppExtension> {
  final screens = [
    Home(),
    Discover(),
    CreateWorkout(),
    Inbox(),
    const ProfilePage()
  ];
  int currentIndex = 0;
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            label: 'Discover',
            icon: Icon(Icons.search),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            label: 'Create Workout',
            icon: Icon(Icons.add),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            label: 'Inbox',
            icon: Icon(Icons.inbox),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.face_outlined),
            backgroundColor: Colors.blue,
          ),
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
