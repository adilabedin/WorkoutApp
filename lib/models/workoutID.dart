class WorkoutID {
  final int? id;
  final String? title;
  final String? description;

  WorkoutID({this.id, this.title, this.description});
  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title};
  }
}
