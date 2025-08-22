import 'package:flutter/material.dart';
import 'package:taski/constants.dart';
import 'package:taski/screens/dashboard_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Image.asset('assets/images/onboarding.png',
                  fit: BoxFit.cover, height: 300)),
          SizedBox(height: 20),
          Text(
            'Welcome to taski app',
            style: kBodyTextStyle,
          ),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () async {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => DashboardPage()));
              },
              child: Text('Get Started'))
        ],
      ),
    );
  }
}
