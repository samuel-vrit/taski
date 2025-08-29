import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taski/models/task_model.dart';
import 'package:taski/widgets/toast_widget.dart';

import 'app_auth_provider.dart';

class TaskProvider extends ChangeNotifier {
  final _tasksCollection = FirebaseFirestore.instance.collection('allTasks');

  List<TaskModel> filteredTasks = [];
  List<TaskModel> doneTasks = [];
  List<TaskModel> allTasks = [];

  Future addTask(TaskModel task) async {
    final docRef = _tasksCollection.doc();
    await docRef.set({
      'id': docRef.id,
      "title": task.title,
      "description": task.description,
      "status": task.status,
      "createdAt": task.createdAt,
      "createdBy": task.createdBy,
    });
    // allTasks.add(task);
    loadAllTasks();
    notifyListeners();
    // await FirebaseFirestore.instance.collection('allTasks').add(task.toJson());
  }

  Future<List<TaskModel>?> loadAllTasks() async {
    try {
      print('fetching tasks');
      var snapShot = await _tasksCollection
          .where('createdBy', isEqualTo: AppAuthProvider().currentUserEmail)
          .get();
      //snapshot.docs contains all the task data in the form of map
      //get those task data one by one and convert them to dart object
      allTasks.clear();
      for (var doc in snapShot.docs) {
        TaskModel task = TaskModel.fromJson(doc.data());
        allTasks.add(task);
      }

      //if you want to use .map() method instead
      // allTasks = snapShot.docs.map((doc) {
      //   return TaskModel.fromJson(doc.data());
      // }).toList();

      notifyListeners();
      return allTasks;
    } catch (e) {
      ToastWidget.error(message: e.toString());
      notifyListeners();
    }
    return null;
  }

  //If you want to implement realtime updates of the tasks use stream.
  //use stream builder in homepage instead of future builder
  //and use this method as stream
  Stream<List<TaskModel>> get tasksStream {
    return _tasksCollection
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return TaskModel.fromJson(doc.data());
      }).toList();
    });
  }

  //method for searching tasks in search page
  void searchTask(String searchText) {
    filteredTasks = allTasks.where((task) {
      return task.title.toLowerCase().contains(searchText.toLowerCase());
    }).toList();
    notifyListeners();
  }

  // void toggleDone(bool isDone, int index) {
  //   // allTasks[index].status = isDone ? 'done' : 'unDone';
  //   // filterDoneTasks();
  //   // notifyListeners();
  // }

  //method to mark task as done and undone
  Future<void> toggleDone(TaskModel task) async {
    try {
      String status = task.status == 'done' ? 'unDone' : 'done';
      await _tasksCollection.doc(task.id).update({
        "status": status,
      });
      loadAllTasks();
    } catch (e) {
      throw Exception('Failed to update task status: $e');
    }
  }

  //method to filter done tasks to show in filter page
  void filterDoneTasks() {
    doneTasks = allTasks.where((task) {
      return task.status == 'done';
    }).toList();
    notifyListeners();
  }

  //method to delete a task
  void deleteDoneTask(TaskModel task) {
    //deleting from firebase
    //get the task id and delete the task document that matches the id in firebase database
    _tasksCollection.doc(task.id).delete();

    //also remove from search page
    filteredTasks.remove(task);
    //delete from done page
    doneTasks.remove(task);

    //now reload all tasks after deletion
    loadAllTasks();
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
