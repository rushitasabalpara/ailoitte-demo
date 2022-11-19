import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rushita_demo/constant/app_color.dart';
import 'package:rushita_demo/constant/app_string.dart';
import 'package:rushita_demo/constant/app_style.dart';
import 'package:rushita_demo/model/drink_model.dart';
import 'package:rushita_demo/module/data/fav_bloc.dart';
import 'package:rushita_demo/module/widget/list_tile.dart';
import 'package:rushita_demo/utils/app_preference.dart';
import 'package:rushita_demo/utils/favourite_model.dart';

import 'drink_detail.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  Stream? drinkStream;

  FavBloc bloc = FavBloc();
  List<DrinkModel> list = [];

  @override
  void initState() {
    bloc.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text(
          AppString.favListTitle,
          style: AppStyle.appBarStyle(),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon:
          const Icon(Icons.arrow_back_ios_new_sharp, color: AppColor.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.black12,
        elevation: 0,
      ),
      body: bloc.favList.isNotEmpty
          ? ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: bloc.favList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => DrinkDetail(
                                  fromFavourite: true,
                                  drinkModel:
                                  bloc.favList[index].drinkModel!.drinks!.first,
                                )));
                    },
                    child: CommonListTile(
                      drinkModel: bloc.favList[index].drinkModel!.drinks!.first,
                    ));
              },
            )
          : Container(),
    );
  }
}
