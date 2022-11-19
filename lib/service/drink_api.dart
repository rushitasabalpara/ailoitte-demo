  import 'package:dio/dio.dart';
  import 'package:rushita_demo/model/drink_model.dart';

  class DrinkListApi{

    Future<DrinkModel> getData()async{
      var dio = Dio();
      final response = await dio.get('https://www.thecocktaildb.com/api/json/v1/1/search.php?s=rum ');
      if(response.statusCode==200){
        return DrinkModel.fromJson(response.data);
      }
      else{
      throw Exception('Failed to load album');

      }

    }

  }
