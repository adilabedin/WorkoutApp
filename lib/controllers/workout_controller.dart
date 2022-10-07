import 'package:get/get.dart';
import 'package:workout_app/models/quick_workout_model.dart';

class WorkoutController extends GetxController {
  final Rx<List<QuickWorkoutModel>> _quickWorkoutList =
      Rx<List<QuickWorkoutModel>>([]);
  List<QuickWorkoutModel> get quickWorkoutList => _quickWorkoutList.value;

  createWorkout(
      String workoutType, String title, int sets, int reps, int resTime) {}

  startWorkout() {}
}
