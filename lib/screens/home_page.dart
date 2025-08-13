import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tap_to_expand/tap_to_expand.dart';
import 'package:taski/constants.dart';
import 'package:taski/widgets/todo_element_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                child: ListView(
                  children: [
                    TodoElementWidget(
                        title: 'Design sign up flow',
                        description: testDescription),
                    SizedBox(height: 16),
                    TodoElementWidget(
                        title: 'Design use case page',
                        description: testDescription),
                    SizedBox(height: 16),
                    TodoElementWidget(
                        title: 'Test Wireframe', description: testDescription),
                    SizedBox(height: 16),
                    TodoElementWidget(
                        title: 'Create new task UI flow',
                        description: testDescription),
                    SizedBox(height: 16),
                    TodoElementWidget(
                        title: 'Collect project assets',
                        description: testDescription),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, items: bottomNavItems),
    );
  }
}

List<BottomNavigationBarItem> bottomNavItems = [
  BottomNavigationBarItem(
      label: 'Todo',
      icon: Image.asset(height: 30, "assets/icons/todo_list.png")),
  BottomNavigationBarItem(
      label: 'Create',
      icon: Image.asset(height: 30, "assets/icons/plus_outlined.png")),
  BottomNavigationBarItem(
      label: 'Search', icon: SizedBox(height: 30, child: Icon(Icons.search))),
  BottomNavigationBarItem(
      label: 'Done',
      icon: Image.asset(height: 30, "assets/icons/checked_outlined.png")),
];
