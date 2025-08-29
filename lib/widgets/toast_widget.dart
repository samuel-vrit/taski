import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastWidget {
  static success({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.green,
      timeInSecForIosWeb: 3,
    );
  }

  static error({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.red,
      timeInSecForIosWeb: 3,
    );
  }
}
