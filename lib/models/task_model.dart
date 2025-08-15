class TaskModel {
  TaskModel({required this.title, this.description = '', this.isDone = false});

  final String title;
  final String description;
  bool isDone;
}
