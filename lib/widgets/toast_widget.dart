import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastWidget {
  static success({required String message}) {
    //hide previous toast before showing another one
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.green,
      timeInSecForIosWeb: 5,
    );
  }

  static error({required String message}) {
    //hide previous toast before showing another one
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.red,
      timeInSecForIosWeb: 5,
    );
  }
}
