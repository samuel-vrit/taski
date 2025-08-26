import 'package:flutter/material.dart';
import 'package:taski/constants.dart';
import 'package:taski/screens/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email;

  String? password;

  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              //Image
              Image.asset(
                "assets/app_logo.png",
                fit: BoxFit.contain,
                width: double.infinity,
                height: 180,
              ),
              SizedBox(height: 27),
              //welcome back
              Text(
                "Welcome Back  👋",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
              //today is new day
              Text(
                  "Today is a new day. It's your day. You shape it. Sign in to start managing your tasks."),
              SizedBox(height: 20),
              Text('Email'),
              SizedBox(height: 5),
              TextField(
                decoration: InputDecoration(
                  hintText: "Please enter your email",
                  hintStyle: TextStyle(color: Color(0XFF8897AD)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0XFFD4D7E3))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0XFF1D4AE9))),
                ),
                onChanged: (value) {
                  email = value;
                },
              ),
              SizedBox(height: 20),
              Text('Password'),
              SizedBox(height: 5),
              TextField(
                obscureText: hidePassword,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      hidePassword = !hidePassword;
                      setState(() {});
                    },
                    child: hidePassword
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                  ),
                  hintText: "Please enter your password",
                  hintStyle: TextStyle(color: Color(0XFF8897AD)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0XFFD4D7E3))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0XFF1D4AE9))),
                ),
                onChanged: (value) {
                  password = value;
                },
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password?',
                    style: TextStyle(color: Color(0XFF1D4AE9)),
                  )
                ],
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0XFF162D3A),
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              // SizedBox(height: 20),
              // Text('Or sign in with'),
              // SizedBox(height: 20),
              // Container(
              //   width: double.infinity,
              //   padding: EdgeInsets.symmetric(vertical: 10),
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(12),
              //       color: Color(0xffF3F9FA)),
              //   child:
              //       Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              //     Image.asset(
              //       'assets/icons/google.png',
              //       height: 30,
              //     ),
              //     SizedBox(width: 5),
              //     Text('Google')
              //   ]),
              // ),
              //
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't you have an account?",
                    style: kBodyTextStyle,
                  ),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupPage()));
                    },
                    child: Text(
                      'Sign up',
                      style: kBodyTextStyle.copyWith(color: kThemeColor),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
