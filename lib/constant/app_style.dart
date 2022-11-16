
import 'package:flutter/material.dart';

import 'app_color.dart';

class AppStyle{
  static TextStyle headerStyle(){
    return TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColor.black
    );
  }
  static TextStyle bodyStyle(){
    return TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w200,
        color: AppColor.black
    );
  }

  static TextStyle appBarStyle(){
    return TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w800,
        color: AppColor.black
    );
  }
}