import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taski/screens/dashboard_page.dart';

class AppAuthProvider extends ChangeNotifier {
  final _auth = FirebaseAuth.instance;

  bool get isLoggedIn {
    return _auth.currentUser != null ? true : false;
  }

  Future signUp(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      var userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (userCredential.user != null) {
        Fluttertoast.showToast(msg: 'Account created successfully');
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (authException) {
      Fluttertoast.showToast(
          msg: authException.message ?? 'Authentication error',
          backgroundColor: Colors.red);
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(), backgroundColor: Colors.red);
    }
  }

  Future signIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      var userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user != null) {
        Fluttertoast.showToast(msg: 'Sign in successfully');

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => DashboardPage()));
      }
    } on FirebaseAuthException catch (authException) {
      Fluttertoast.showToast(
          msg: authException.message ?? 'Authentication error',
          backgroundColor: Colors.red);
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(), backgroundColor: Colors.red);
    }
  }
}
