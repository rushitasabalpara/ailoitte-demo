import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rushita_demo/model/drink_model.dart';
import 'package:rushita_demo/module/bloc/drink_event.dart';
import 'package:rushita_demo/module/bloc/drink_state.dart';
import 'package:rushita_demo/service/drink_api.dart';

class DrinkBloc extends Bloc<DrinkEvent, DrinkState> {
  DrinkBloc() : super(DrinkInitialState()) {
    on<GetDataEvent>(_onInitialEvent);
    on<SearchEvent>(_onSearchEvent);
  }

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
}
