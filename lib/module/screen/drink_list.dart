import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rushita_demo/constant/app_string.dart';
import 'package:rushita_demo/constant/app_style.dart';
import 'package:rushita_demo/constant/icon.dart';
import 'package:rushita_demo/model/drink_model.dart';
import 'package:rushita_demo/module/bloc/drink_bloc.dart';
import 'package:rushita_demo/module/bloc/drink_event.dart';
import 'package:rushita_demo/module/bloc/drink_state.dart';
import 'package:rushita_demo/module/data/fav_bloc.dart';
import 'package:rushita_demo/module/screen/drink_detail.dart';
import 'package:rushita_demo/module/screen/favourite.dart';
import 'package:rushita_demo/module/widget/list_tile.dart';
import 'package:rushita_demo/utils/favourite_model.dart';

class DrinkList extends StatefulWidget {
  const DrinkList({Key? key}) : super(key: key);

  @override
  State<DrinkList> createState() => _DrinkListState();
}

class _DrinkListState extends State<DrinkList> {


  Stream? drinkStream;
  DrinkModel? drinkModel;
  @override
  void initState() {
    // TODO: implement initState
    context.read<DrinkBloc>().add(GetDataEvent());
    super.initState();
  }


FavBloc favBloc=FavBloc();
  List<FavouriteModel> favList=[];


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrinkBloc, DrinkState>(
      builder: (context, state) {
        if (state is DrinkLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is DrinkInitialState) {
          drinkModel = state.drinkModel;
        }
        return  Scaffold(
          appBar: AppBar(
            title: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>Favourite()));
              },
              child: Text(
                AppString.listTitle,
                style: AppStyle.appBarStyle(),
              ),
            ),
            actions: [
              InkWell(
                onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>Favourite())),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(AppIcon.fillHeartIcon, height: 45,),
                      ),
                      Container(
                          margin: const EdgeInsets.only(left: 30,top: 5),
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.white,
                            child: Text(favList.isEmpty?'0':favList.length.toString()),
                          )),
                    ],
                  ),
                ),
              )
            ],
            centerTitle: true,
            backgroundColor: Colors.black12,
            elevation: 0,
          ),
          body: drinkModel == null
              ? Container()
              :Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: AppString.hintText,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onChanged: (value) {
                    context
                        .read<DrinkBloc>()
                        .add(SearchEvent(value: value));
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: drinkModel!.drinks!.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => DrinkDetail(
                                    drinkModel:
                                    drinkModel!.drinks![index],
                                  ))).then((value) {
                            if(value){
                              setState((){
                                favList=favBloc.fetchData();
                              });
                            }
                          });
                        },
                        child: CommonListTile(
                          drinkModel: drinkModel!.drinks![index],
                        ));
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
