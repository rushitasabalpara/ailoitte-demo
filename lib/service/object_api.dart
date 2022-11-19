import 'package:dio/dio.dart';
import 'package:rushita_demo/model/drink_model.dart';

class ObjectApi{

  Future<DrinkModel> getData(String id)async{
    var dio = Dio();
    final response = await dio.get('https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=$id');
    if(response.statusCode==200){
      print('response  ${response.data}');
      return DrinkModel.fromJson(response.data);
    }
    else{
      throw Exception('Failed to load album');

    }

  }

}