import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:taski/models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> filteredTasks = [];
  List<TaskModel> doneTasks = [];

  List<TaskModel> allTasks = [];

  Future addTask(TaskModel task) async {
    await FirebaseFirestore.instance.collection('allTasks').add(task.toJson());
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
