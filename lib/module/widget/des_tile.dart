import 'package:flutter/material.dart';
import 'package:rushita_demo/constant/app_style.dart';

class DesTile extends StatelessWidget {
  final String? title;
  final String? value;
  const DesTile({Key? key, this.title, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(title??'',style: AppStyle.headerStyle(),),
      Text(value??'',style: AppStyle.bodyStyle(),),
    ],);
  }
}
