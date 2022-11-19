

import 'dart:async';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:rushita_demo/module/widget/toast.dart';
import 'package:rushita_demo/utils/favourite_model.dart';

class FavBloc{
  static final FavBloc _instance=FavBloc._internal();

  factory FavBloc(){
    return _instance;
  }

  FavBloc._internal();

  StreamController<FavouriteModel> con = StreamController<FavouriteModel>();

List<FavouriteModel> favList=[];
  addData(FavouriteModel model){
    if(favList.isNotEmpty){
      favList.forEach((element) {
        if(element.drinkModel!.drinks!.first.idDrink!=model.drinkModel!.drinks!.first.idDrink){
          con.sink.add(model);
          favList.add(model);
        }
      });
    }
else{
      con.sink.add(model);
      favList.add(model);
    }
  }
  List<FavouriteModel> fetchData(){

    return favList;
  }
}