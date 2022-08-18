import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:workout_app/models/workoutID.dart';

class DatabaseHelper {
  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'workout.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE Workouts(id INTEGER PRIMARY KEY, title TEXT, description TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertTask(WorkoutID workoutID) async {
    Database _db = await database();
    await _db.insert('workouts', workoutID.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
