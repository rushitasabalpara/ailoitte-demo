import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class CustomToast {
  showToast(String? msg) {
    Fluttertoast.showToast(
        msg: msg.toString(),
        backgroundColor: Colors.green,
        textColor: Colors.white,
        webPosition: 'center');
  }
  errorToast(String? msg,) {
    Fluttertoast.showToast(
        msg: msg.toString(),
        textColor: Colors.white,
        backgroundColor: Colors.red,
        webPosition: 'center');
  }
}
