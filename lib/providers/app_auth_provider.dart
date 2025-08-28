import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taski/models/user_model.dart';
import 'package:taski/screens/dashboard_page.dart';

class AppAuthProvider extends ChangeNotifier {
  //for authentication services
  final _auth = FirebaseAuth.instance;

  //for database services where user data and tasks data are stored
  final _fireStore = FirebaseFirestore.instance;

  //to check if user is logged in or not
  bool get isLoggedIn {
    return _auth.currentUser != null ? true : false;
  }

  //variable for saving userData
  UserModel? userData;

  //creating a new account
  Future signUp(
      {required String email,
      required String password,
      required String name,
      required BuildContext context}) async {
    try {
      //creating a account in firebase
      var userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // proceed only id the user is not null otherwise do not proceed
      if (userCredential.user != null) {
        //creating a user object using user's data
        var userData = UserModel(name: name, email: email);

        //converting user object to json(Map) and uploading it to firebase database
        await _fireStore
            .collection('allUsers')
            .doc(email)
            .set(userData.toJson());

        //show toast message after successful
        Fluttertoast.showToast(msg: 'Account created successfully');

        //exit the sign up screen and return login screen
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (authException) {
      //throw this error if the error is related to authentication
      Fluttertoast.showToast(
          msg: authException.message ?? 'Authentication error',
          backgroundColor: Colors.red);
    } catch (e) {
      //throw this error for other types of error
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
        fetchUserData();
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

  Future fetchUserData() async {
    var docSnapShot = await _fireStore
        .collection('allUsers')
        .where('email', isEqualTo: _auth.currentUser!.email)
        .get();
    if (docSnapShot.docs.isNotEmpty) {
      Map<String, dynamic> response = docSnapShot.docs.first.data();

      userData = UserModel.fromJson(response);
      notifyListeners();
    }
  }
}
