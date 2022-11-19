import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rushita_demo/module/bloc/drink_bloc.dart';
import 'package:rushita_demo/module/screen/drink_list.dart';

List<BlocProvider> blocProvider=[
  BlocProvider<DrinkBloc>(
    create: (context) =>
    DrinkBloc(),
    child: const DrinkList(),
  ),
];