import 'package:json_annotation/json_annotation.dart';
import 'package:rushita_demo/model/drink_model.dart';
part 'favourite_model.g.dart';


@JsonSerializable()
class FavouriteModel{
  final bool? favourite;
  final DrinkModel? drinkModel;
  FavouriteModel({this.favourite,this.drinkModel});

  factory FavouriteModel.fromJson(Map<String,dynamic> data) => _$FavouriteModelFromJson(data);

  Map<String,dynamic> toJson() => _$FavouriteModelToJson(this);
}