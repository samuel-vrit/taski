import 'package:flutter/material.dart';
import 'package:taski/models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> filteredTasks = [];
  List<TaskModel> doneTasks = [];

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

  void addTask(TaskModel task) {
    allTasks.add(task);
    notifyListeners();
  }

  void searchTask(String searchText) {
    filteredTasks = allTasks.where((task) {
      return task.title.toLowerCase().contains(searchText.toLowerCase());
    }).toList();
    notifyListeners();
  }

  void toggleDone(bool isDone, int index) {
    allTasks[index].status = isDone ? 'done' : 'unDone';
    filterDoneTasks();
    notifyListeners();
  }

  void filterDoneTasks() {
    doneTasks = allTasks.where((task) {
      return task.status == 'done';
    }).toList();
    notifyListeners();
  }

  void deleteDoneTask(TaskModel task) {
    doneTasks.remove(task);
    allTasks.remove(task);
    filteredTasks.remove(task);
    notifyListeners();
  }

  void deleteAllDoneTasks() {
    for (var task in doneTasks) {
      allTasks.remove(task);
      filteredTasks.remove(task);
    }
    doneTasks.clear();
    notifyListeners();
  }
}
