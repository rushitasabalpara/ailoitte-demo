import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rushita_demo/model/drink_model.dart';
import 'package:rushita_demo/module/bloc/drink_event.dart';
import 'package:rushita_demo/module/bloc/drink_state.dart';
import 'package:rushita_demo/module/data/fav_bloc.dart';
import 'package:rushita_demo/module/widget/toast.dart';
import 'package:rushita_demo/service/drink_api.dart';
import 'package:rushita_demo/service/object_api.dart';
import 'package:rushita_demo/utils/app_preference.dart';
import 'package:rushita_demo/utils/favourite_model.dart';

class DrinkBloc extends Bloc<DrinkEvent, DrinkState> {
  DrinkBloc() : super(DrinkInitialState()) {
   // _counterEventController.stream.listen(_count);
    on<GetDataEvent>(_onInitialEvent);
    on<SearchEvent>(_onSearchEvent);
    on<FavouriteEvent>(_onFavouriteEvent);
    on<InitialEvent>(_onInitEvent);
  }



  StreamController<DrinkModel> controller = StreamController<DrinkModel>();
  Stream? st ;
  DrinkModel? drinkModel;
  DrinkModel? tempModel;

  FutureOr<void> _onInitialEvent(
      GetDataEvent event, Emitter<DrinkState> emit) async {
    emit(DrinkLoadingState());
    if (event is GetDataEvent) {
      drinkModel = await DrinkListApi().getData();
      tempModel = drinkModel;
      emit(DrinkInitialState(drinkModel: drinkModel));
    }
  }
  StreamController<DrinkState> con=StreamController<DrinkState>.broadcast();
  FutureOr<void> _onSearchEvent(
      SearchEvent event, Emitter<DrinkState> emit) async {
    if (event is SearchEvent) {
      tempModel = await DrinkListApi().getData();
      if (event.value!.isNotEmpty) {
        tempModel!.drinks = drinkModel!.drinks!
            .where((element) => element.strDrink!
                .toLowerCase()
                .contains(event.value!.toLowerCase()))
            .toList();
        emit(DrinkInitialState(drinkModel: tempModel));
      } else {
        tempModel = await DrinkListApi().getData();
        emit(DrinkInitialState(drinkModel: tempModel));
      }
    }
  }

  FutureOr<void> _onFavouriteEvent(FavouriteEvent event, Emitter<DrinkState> emit) async{
    if (event is FavouriteEvent) {
      if(event.favourite==true){
        DrinkModel drink=await ObjectApi().getData(event.id!);
        AppPreference.set('model', jsonEncode(FavouriteModel(favourite: event.favourite,drinkModel: drink)));

        FavBloc().addData(FavouriteModel(favourite: event.favourite,drinkModel: drink));
      }
      emit(DrinkInitialState(drinkModel: tempModel,favourite: event.favourite!));
    }
  }


  FutureOr<void> _onInitEvent(InitialEvent event, Emitter<DrinkState> emit) {

  }
}
