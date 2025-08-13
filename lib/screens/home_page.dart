import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taski/constants.dart';
import 'package:taski/models/task_model.dart';
import 'package:taski/widgets/todo_element_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String testDescription =
      "By the time a prospect arrives at your signup page, in most cases, they've already By the time a prospect arrives at your signup page, in most cases.";

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

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/app_logo.png',
                    height: 40,
                    width: 40,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Taski',
                    style: kHeadingTextStyle1,
                  ),
                  Spacer(),
                  Text(
                    'John',
                    style: kHeadingTextStyle2,
                  ),
                  SizedBox(width: 10),
                  CircleAvatar(
                    radius: 18,
                    backgroundImage:
                        AssetImage('assets/images/profile_image.png'),
                  )
                ],
              ),
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
                'You’ve got 7 tasks to do.',
                style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: kTextColor02,
                ),
              ),
              SizedBox(height: 32),
              Expanded(
                child: ListView.separated(
                    itemCount: tasksList.length,
                    separatorBuilder: (_, __) {
                      return SizedBox(height: 16);
                    },
                    itemBuilder: (context, index) {
                      return TodoElementWidget(
                        title: tasksList[index].title,
                        description: tasksList[index].description,
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          currentIndex = value;
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
