import 'package:flutter/material.dart';
import 'package:rushita_demo/constant/app_color.dart';
import 'package:rushita_demo/constant/app_string.dart';
import 'package:rushita_demo/constant/app_style.dart';

import '../../model/drink_model.dart';

class DrinkDetail extends StatefulWidget {
  final Drinks? drinkModel;

  const DrinkDetail({Key? key, this.drinkModel}) : super(key: key);

  @override
  State<DrinkDetail> createState() => _DrinkDetailState();
}

class _DrinkDetailState extends State<DrinkDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text(
          AppString.detailTitle,
          style: AppStyle.appBarStyle(),
        ),
        leading:  IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon:const Icon(Icons.arrow_back_ios_new_sharp,color: AppColor.black),
          ),
        centerTitle: true,
        backgroundColor: Colors.black12,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              widget.drinkModel!.strDrinkThumb == null
                  ? Container(
                      height: 300,
                      child: CircularProgressIndicator(),
                    )
                  : Image.network(
                      widget.drinkModel!.strDrinkThumb!,
                      fit: BoxFit.cover,
                      //height: 200,
                    ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(AppString.ingreList, style: AppStyle.headerStyle()),
              ),
              Wrap(
                children: [
                  Text(
                      '${widget.drinkModel!.strIngredient1} ,'
                          ' ${widget.drinkModel!.strIngredient2} ,'
                          ' ${widget.drinkModel!.strIngredient3} , '
                          '${widget.drinkModel!.strIngredient4} , '
                          '${widget.drinkModel!.strIngredient5} ,'
                          ??
                          '',style: AppStyle.bodyStyle(),),
                ],
              ),Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(AppString.instruction, style: AppStyle.headerStyle()),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.drinkModel!.strInstructionsIT??'', style: AppStyle.bodyStyle()),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(AppString.description, style: AppStyle.headerStyle()),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.drinkModel!.strInstructionsDE??'', style: AppStyle.bodyStyle()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
