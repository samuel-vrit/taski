import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:taski/constants.dart';
import 'package:taski/models/task_model.dart';
import 'package:taski/providers/task_provider.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        HomePage(),
        HomePage(),
        SearchPage(),
        DonePage(),
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
                        context.read<TaskProvider>().addTask(TaskModel(
                            title: taskTitle ?? 'No title',
                            description: taskDescription ?? ''));
                        taskTitle = null;
                        taskDescription = null;
                        Navigator.pop(context);
                      } else {
                        Fluttertoast.showToast(
                          msg: 'Task title cannot be empty',
                          backgroundColor: Colors.red,
                        );
                      }
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
