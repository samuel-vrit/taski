class TaskModel {
  TaskModel(
      {required this.title, this.description = '', this.status = 'undone'});

  final String title;
  final String description;
  String status;
}
