import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taski/constants.dart';
import 'package:taski/providers/task_provider.dart';
import 'package:taski/widgets/custom_app_bar.dart';

class DonePage extends StatefulWidget {
  const DonePage({super.key});

  @override
  State<DonePage> createState() => _DonePageState();
}

class _DonePageState extends State<DonePage> {
  @override
  void initState() {
    init();
    super.initState();
  }

  init() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TaskProvider>().filterDoneTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, taskProvider, child) {
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
                          // doneTasks.clear();
                          // setState(() {});
                        },
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<TaskProvider>().deleteAllDoneTasks();
                          },
                          child: Text(
                            'Delete all',
                            style: kBodyTextStyle.copyWith(color: Colors.red),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  Expanded(
                    child: ListView.separated(
                      itemCount: taskProvider.doneTasks.length,
                      itemBuilder: (context, index) => DeleteTaskElement(
                        title: taskProvider.doneTasks[index].title,
                        onDelete: () {
                          taskProvider
                              .deleteDoneTask(taskProvider.doneTasks[index]);
                        },
                      ),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
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
