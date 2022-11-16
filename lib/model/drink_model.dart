import 'package:json_annotation/json_annotation.dart';
part 'drink_model.g.dart';

@JsonSerializable()
class DrinkModel {
  List<Drinks>? drinks;

  DrinkModel({this.drinks});


  factory DrinkModel.fromJson(Map<String,dynamic> data) => _$DrinkModelFromJson(data);

  Map<String,dynamic> toJson() => _$DrinkModelToJson(this);

/*  DrinkModel.fromJson(Map<String, dynamic> json) {
    if (json['drinks'] != null) {
      drinks = <Drinks>[];
      json['drinks'].forEach((v) {
        drinks!.add(new Drinks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.drinks != null) {
      data['drinks'] = this.drinks!.map((v) => v.toJson()).toList();
    }
    return data;
  }*/
}
@JsonSerializable()
class Drinks {
  String? idDrink;
  String? strDrink;
  String? strDrinkAlternate;
  String? strTags;
  String? strVideo;
  String? strCategory;
  String? strIBA;
  String? strAlcoholic;
  String? strGlass;
  String? strInstructions;
  String? strInstructionsES;
  String? strInstructionsDE;
  String? strInstructionsFR;
  String? strInstructionsIT;
  String? strInstructionsZHHANS;
  String? strInstructionsZHHANT;
  String? strDrinkThumb;
  String? strIngredient1;
  String? strIngredient2;
  String? strIngredient3;
  String? strIngredient4;
  String? strIngredient5;
  String? strIngredient6;
  String? strIngredient7;
  String? strIngredient8;
  String? strIngredient9;
  String? strIngredient10;
  String? strIngredient11;
  String? strIngredient12;
  String? strIngredient13;
  String? strIngredient14;
  String? strIngredient15;
  String? strMeasure1;
  String? strMeasure2;
  String? strMeasure3;
  String? strMeasure4;
  String? strMeasure5;
  String? strMeasure6;
  String? strMeasure7;
  String? strMeasure8;
  String? strMeasure9;
  String? strMeasure10;
  String? strMeasure11;
  String? strMeasure12;
  String? strMeasure13;
  String? strMeasure14;
  String? strMeasure15;
  String? strImageSource;
  String? strImageAttribution;
  String? strCreativeCommonsConfirmed;
  String? dateModified;

  Drinks(
      {this.idDrink,
        this.strDrink,
        this.strDrinkAlternate,
        this.strTags,
        this.strVideo,
        this.strCategory,
        this.strIBA,
        this.strAlcoholic,
        this.strGlass,
        this.strInstructions,
        this.strInstructionsES,
        this.strInstructionsDE,
        this.strInstructionsFR,
        this.strInstructionsIT,
        this.strInstructionsZHHANS,
        this.strInstructionsZHHANT,
        this.strDrinkThumb,
        this.strIngredient1,
        this.strIngredient2,
        this.strIngredient3,
        this.strIngredient4,
        this.strIngredient5,
        this.strIngredient6,
        this.strIngredient7,
        this.strIngredient8,
        this.strIngredient9,
        this.strIngredient10,
        this.strIngredient11,
        this.strIngredient12,
        this.strIngredient13,
        this.strIngredient14,
        this.strIngredient15,
        this.strMeasure1,
        this.strMeasure2,
        this.strMeasure3,
        this.strMeasure4,
        this.strMeasure5,
        this.strMeasure6,
        this.strMeasure7,
        this.strMeasure8,
        this.strMeasure9,
        this.strMeasure10,
        this.strMeasure11,
        this.strMeasure12,
        this.strMeasure13,
        this.strMeasure14,
        this.strMeasure15,
        this.strImageSource,
        this.strImageAttribution,
        this.strCreativeCommonsConfirmed,
        this.dateModified});


  factory Drinks.fromJson(Map<String,dynamic> data) => _$DrinksFromJson(data);

  Map<String,dynamic> toJson() => _$DrinksToJson(this);

}


