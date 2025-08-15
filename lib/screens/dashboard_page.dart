import 'package:flutter/material.dart';
import 'package:taski/constants.dart';
import 'package:taski/models/task_model.dart';
import 'package:taski/screens/done_page.dart';
import 'package:taski/screens/home_page.dart';
import 'package:taski/screens/search_page.dart';
import 'package:taski/widgets/add_task_sheet.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int currentIndex = 0;

  String? taskTitle;

  String? taskDescription;

  List<TaskModel> tasksList = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        HomePage(tasksList: tasksList),
        HomePage(tasksList: tasksList),
        SearchPage(),
        DonePage()
      ][currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) async {
          currentIndex = value;
          if (currentIndex == 1) {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return AddTaskSheet(
                    onTitleChanged: (title) {
                      taskTitle = title;
                    },
                    onDescriptionChanged: (description) {
                      taskDescription = description;
                    },
                    onCreate: () {
                      if (taskTitle != null) {
                        tasksList.add(TaskModel(
                            title: taskTitle ?? '',
                            description: taskDescription ?? ''));

                        taskTitle = null;
                        Navigator.pop(context);
                      }
                      setState(() {});
                    },
                  );
                });
          }

          setState(() {});
        },
        currentIndex: currentIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: kThemeColor,
        type: BottomNavigationBarType.fixed,
        items: bottomNavItems,
      ),
    );
  }
}

List<BottomNavigationBarItem> bottomNavItems = [
  BottomNavigationBarItem(label: 'Todo', icon: Icon(Icons.view_list)),
  BottomNavigationBarItem(label: 'Create', icon: Icon(Icons.add_box_outlined)),
  BottomNavigationBarItem(label: 'Search', icon: Icon(Icons.search)),
  BottomNavigationBarItem(label: 'Done', icon: Icon(Icons.check_box_outlined)),
];
