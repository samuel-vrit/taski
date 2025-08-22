import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taski/constants.dart';
import 'package:taski/providers/task_provider.dart';
import 'package:taski/widgets/custom_app_bar.dart';
import 'package:taski/widgets/todo_element_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(builder: (context, taskProvider, child) {
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
                    taskProvider.searchTask(searchText);
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
                      itemCount: taskProvider.filteredTasks.length,
                      separatorBuilder: (_, __) {
                        return SizedBox(height: 16);
                      },
                      itemBuilder: (context, index) {
                        return TodoElementWidget(
                          title: taskProvider.filteredTasks[index].title,
                          description:
                              taskProvider.filteredTasks[index].description,
                          isDone: taskProvider.filteredTasks[index].status ==
                              'done',
                          onDone: (isDone) {
                            taskProvider.toggleDone(isDone!, index);
                          },
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
