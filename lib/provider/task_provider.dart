import 'package:flutter/cupertino.dart';
import 'package:taski/models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> allTasks = [
    TaskModel(
        title: 'Design sign up flow',
        description:
            "By the time a prospect arrives at your signup page, in most cases, they've already By the time a prospect arrives at your signup page, in most cases."),
    TaskModel(
        title: 'Design use case page',
        description:
            "By the time a prospect arrives at your signup page, in most cases, they've already By the time a prospect arrives at your signup page, in most cases."),
    TaskModel(
        title: 'Test Wireframe',
        description:
            "By the time a prospect arrives at your signup page, in most cases, they've already By the time a prospect arrives at your signup page, in most cases."),
    TaskModel(
        title: 'Create new task UI flow',
        description:
            "By the time a prospect arrives at your signup page, in most cases, they've already By the time a prospect arrives at your signup page, in most cases."),
    TaskModel(
        title: 'Collect project assets',
        description:
            "By the time a prospect arrives at your signup page, in most cases, they've already By the time a prospect arrives at your signup page, in most cases."),
    TaskModel(
        title: 'Collect Skills list',
        description:
            "By the time a prospect arrives at your signup page, in most cases, they've already By the time a prospect arrives at your signup page, in most cases."),
  ];

  removeTask(int index) {
    allTasks.removeAt(index);
    notifyListeners();
  }
}
