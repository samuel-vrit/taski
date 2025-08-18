import 'package:flutter/material.dart';
import 'package:taski/constants.dart';
import 'package:taski/models/task_model.dart';
import 'package:taski/widgets/custom_app_bar.dart';
import 'package:taski/widgets/todo_element_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({required this.allTasks, super.key});
  final List<TaskModel> allTasks;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<TaskModel> filteredTasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CustomAppBar(),
              SizedBox(height: 32),
              TextField(
                onChanged: (searchText) {
                  filteredTasks = widget.allTasks.where((task) {
                    return task.title
                        .toLowerCase()
                        .contains(searchText.toLowerCase());
                  }).toList();
                  setState(() {});
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search tasks',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: kBorderColor)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: kThemeColor)),
                ),
              ),
              SizedBox(height: 32),
              Expanded(
                child: ListView.separated(
                    itemCount: filteredTasks.length,
                    separatorBuilder: (_, __) {
                      return SizedBox(height: 16);
                    },
                    itemBuilder: (context, index) {
                      return TodoElementWidget(
                        title: filteredTasks[index].title,
                        description: filteredTasks[index].description,
                        isDone: filteredTasks[index].status == 'done',
                        onDone: (isDone) {
                          filteredTasks[index].status =
                              isDone ?? false ? 'done' : 'undone';
                          setState(() {});
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
