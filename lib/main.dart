import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taski/providers/task_provider.dart';
import 'package:taski/screens/dashboard_page.dart';
import 'package:taski/screens/home_page.dart';
import 'package:taski/screens/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
        title: 'Taski',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashPage(),
      ),
    );
  }
}
