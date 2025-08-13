class TaskModel {
  const TaskModel(
      {required this.title, this.description = '', this.isDone = false});

  final String title;
  final String description;
  final bool isDone;
}
