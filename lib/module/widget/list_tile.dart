
import 'package:flutter/material.dart';
import 'package:rushita_demo/constant/app_color.dart';
import 'package:rushita_demo/constant/app_string.dart';
import 'package:rushita_demo/model/drink_model.dart';
import 'package:rushita_demo/module/widget/des_tile.dart';


class CommonListTile extends StatelessWidget {
  final Drinks? drinkModel;
  const CommonListTile({Key? key, this.drinkModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.grey.withOpacity(0.4)
      ),
      child: Column(
        children: [
          drinkModel!.strDrinkThumb==null?Container(
            height: 200,
            child: CircularProgressIndicator(),
          ):Image.network(
            drinkModel!.strDrinkThumb!,
            fit: BoxFit.cover,
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.only(top:15),
            child:DesTile(title: AppString.name,value: drinkModel!.strDrink,)
          ),
          DesTile(title: AppString.category,value: drinkModel!.strCategory,),
          DesTile(title: AppString.alcohol,value: drinkModel!.strAlcoholic,),
          DesTile(title: AppString.glass,value: drinkModel!.strGlass,),
        ],
      ),
    );
  }
}
