import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:taski/constants.dart';
import 'package:taski/providers/task_provider.dart';
import 'package:taski/widgets/custom_app_bar.dart';
import 'package:taski/widgets/todo_element_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(builder: (context, taskProvider, child) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),
                SizedBox(height: 30),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: 'Welcome, ', style: kHeadingTextStyle1),
                      TextSpan(
                        text: 'John',
                        style: kHeadingTextStyle1.copyWith(color: kThemeColor),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'You’ve got ${taskProvider.allTasks.length - taskProvider.doneTasks.length} tasks to do.',
                  style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: kTextColor02,
                  ),
                ),
                SizedBox(height: 32),
                Expanded(
                  child: ListView.separated(
                      itemCount: taskProvider.allTasks.length,
                      separatorBuilder: (_, __) {
                        return SizedBox(height: 16);
                      },
                      itemBuilder: (context, index) {
                        return TodoElementWidget(
                          title: taskProvider.allTasks[index].title,
                          description: taskProvider.allTasks[index].description,
                          isDone: taskProvider.allTasks[index].status == 'done',
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
