import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taski/constants.dart';
import 'package:taski/models/task_model.dart';
import 'package:taski/widgets/add_task_sheet.dart';
import 'package:taski/widgets/custom_app_bar.dart';
import 'package:taski/widgets/todo_element_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({required this.tasksList, super.key});

  final List<TaskModel> tasksList;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String testDescription =
      "By the time a prospect arrives at your signup page, in most cases, they've already By the time a prospect arrives at your signup page, in most cases.";

  @override
  Widget build(BuildContext context) {
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
                'You’ve got ${widget.tasksList.length} tasks to do.',
                style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: kTextColor02,
                ),
              ),
              SizedBox(height: 32),
              Expanded(
                child: ListView.separated(
                    itemCount: widget.tasksList.length,
                    separatorBuilder: (_, __) {
                      return SizedBox(height: 16);
                    },
                    itemBuilder: (context, index) {
                      return TodoElementWidget(
                        title: widget.tasksList[index].title,
                        description: widget.tasksList[index].description,
                        isDone: widget.tasksList[index].isDone,
                        onDone: (isDone) {
                          widget.tasksList[index].isDone = isDone ?? false;
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
