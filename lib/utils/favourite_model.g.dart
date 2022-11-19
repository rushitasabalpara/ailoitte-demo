// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavouriteModel _$FavouriteModelFromJson(Map<String, dynamic> json) =>
    FavouriteModel(
      favourite: json['favourite'] as bool?,
      drinkModel: json['drinkModel'] == null
          ? null
          : DrinkModel.fromJson(json['drinkModel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FavouriteModelToJson(FavouriteModel instance) =>
    <String, dynamic>{
      'favourite': instance.favourite,
      'drinkModel': instance.drinkModel,
    };
