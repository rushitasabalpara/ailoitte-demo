import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rushita_demo/constant/app_string.dart';
import 'package:rushita_demo/module/bloc/drink_bloc.dart';

import 'module/screen/drink_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.appTitle,
      home: BlocProvider(
        create: (context)=>DrinkBloc(),
        child: DrinkList(),
      ),
    );
  }
}


