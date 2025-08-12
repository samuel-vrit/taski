import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tap_to_expand/tap_to_expand.dart';
import 'package:taski/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                  TapToExpand(
                    titlePadding: EdgeInsets.all(16),
                    backgroundcolor: Colors.white,
                    // closedHeight: 60,
                    openedHeight: 100,
                    title: Row(
                      children: [
                        Checkbox(
                          value: false,
                          side: BorderSide(color: Colors.grey, width: 2),
                          onChanged: (val) {},
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Design use case page',
                          style: kBodyTextStyle,
                        )
                      ],
                    ),
                    content: Text(
                        "By the time a prospect arrives at your signup page, in most cases, they've already By the time a prospect arrives at your signup page, in most cases."),
                  )
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
