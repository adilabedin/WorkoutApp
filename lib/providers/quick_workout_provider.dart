import 'package:flutter/material.dart';

class QuickWorkoutProvider with ChangeNotifier {
  String _title = '';
  String _sets = '';
  String _reps = '';
  String _restTime = '';

  String get title => _title;
  String get sets => _sets;
  String get reps => _reps;
  String get restTime => _restTime;

  setTitle(String title) {
    _title = title;
    notifyListeners();
  }

  setSets(String sets) {
    _sets = sets;
    notifyListeners();
  }

  setReps(String reps) {
    _reps = reps;
    notifyListeners();
  }

  setRestTime(String restTime) {
    _restTime = restTime;
    notifyListeners();
  }
}
