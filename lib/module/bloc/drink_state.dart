import 'package:flutter/src/widgets/framework.dart';
import 'package:rushita_demo/model/drink_model.dart';

abstract class DrinkState{
}

class DrinkInitialState extends DrinkState{
final DrinkModel? drinkModel;
final bool favourite;

DrinkInitialState( {this.drinkModel,this.favourite=false,});
  
}

class DrinkLoadingState extends DrinkState{



}