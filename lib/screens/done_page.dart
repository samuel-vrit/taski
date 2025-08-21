import 'package:flutter/material.dart';
import 'package:taski/constants.dart';
import 'package:taski/models/task_model.dart';
import 'package:taski/widgets/custom_app_bar.dart';

class DonePage extends StatefulWidget {
  const DonePage({required this.allTasks, super.key});

  final List<TaskModel> allTasks;

  @override
  State<DonePage> createState() => _DonePageState();
}

class _DonePageState extends State<DonePage> {
  List<TaskModel> doneTasks = [];

  @override
  void initState() {
    init();
    super.initState();
  }

  init() {
    doneTasks = widget.allTasks.where((task) {
      return task.status == 'done';
    }).toList();
    setState(() {});
  }

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Completed Tasks',
                    style: kHeadingTextStyle1,
                  ),
                  GestureDetector(
                    onTap: () {
                      doneTasks.clear();
                      setState(() {});
                    },
                    child: Text(
                      'Delete all',
                      style: kBodyTextStyle.copyWith(color: Colors.red),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32),
              Expanded(
                child: ListView.separated(
                  itemCount: doneTasks.length,
                  itemBuilder: (context, index) => DeleteTaskElement(
                    title: doneTasks[index].title,
                    onDelete: () {
                      doneTasks.removeAt(index);
                      setState(() {});
                    },
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DeleteTaskElement extends StatelessWidget {
  const DeleteTaskElement({
    required this.title,
    this.onDelete,
    super.key,
  });

  final String title;
  final void Function()? onDelete;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kBackGroundGrey,
      ),
      child: Row(
        children: [
          // Checkbox(
          //   value: true,
          //   side: BorderSide(color: Colors.grey, width: 2),
          //   onChanged: (val) {},
          // ),
          SizedBox(width: 16),
          Text(
            title,
            style: kBodyTextStyle.copyWith(color: kTextColor02),
          ),
          Spacer(),
          GestureDetector(
            onTap: onDelete,
            child: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
