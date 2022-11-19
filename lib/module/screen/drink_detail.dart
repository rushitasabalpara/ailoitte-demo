import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rushita_demo/constant/app_color.dart';
import 'package:rushita_demo/constant/app_string.dart';
import 'package:rushita_demo/constant/app_style.dart';
import 'package:rushita_demo/constant/icon.dart';
import 'package:rushita_demo/module/bloc/drink_bloc.dart';
import 'package:rushita_demo/module/bloc/drink_event.dart';
import 'package:rushita_demo/module/bloc/drink_state.dart';
import 'package:rushita_demo/module/widget/toast.dart';

import '../../model/drink_model.dart';

class DrinkDetail extends StatefulWidget {
  final bool fromFavourite;
  final Drinks? drinkModel;

  const DrinkDetail({Key? key, this.drinkModel, this.fromFavourite=false}) : super(key: key);

  @override
  State<DrinkDetail> createState() => _DrinkDetailState();
}

class _DrinkDetailState extends State<DrinkDetail> {
  DrinkBloc bloc = DrinkBloc();
  bool favourite = false;

  @override
  void initState() {
    context.read<DrinkBloc>().add(
        FavouriteEvent(
            favourite: favourite));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppString.detailTitle,
          style: AppStyle.appBarStyle(),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context,true);
          },
          icon:
              const Icon(Icons.arrow_back_ios_new_sharp, color: AppColor.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.black12,
        elevation: 0,
      ),
      body: BlocConsumer<DrinkBloc, DrinkState>(
        listener: (context,state){},
        builder: (context,state){
          if (state is DrinkInitialState) {
           favourite=state.favourite;
          }
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  widget.drinkModel!.strDrinkThumb == null
                      ? Container(
                    height: 300,
                    child: CircularProgressIndicator(),
                  )
                      : Stack(
                    children: [
                      Image.network(
                        widget.drinkModel!.strDrinkThumb!,
                        fit: BoxFit.cover,
                        //height: 200,
                      ),
                      if(!widget.fromFavourite)Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                                onTap: () {
                                  context.read<DrinkBloc>().add(
                                      FavouriteEvent(
                                          id: widget.drinkModel!.idDrink,
                                          favourite: !favourite));
                                },
                                child: Image.asset(
                                  favourite?AppIcon.fillHeartIcon:AppIcon.heartIcon,
                                  height: 30,
                                )),
                          )),
                    ],
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
                            '${widget.drinkModel!.strIngredient5} ,',
                        style: AppStyle.bodyStyle(),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                    Text(AppString.instruction, style: AppStyle.headerStyle()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.drinkModel!.strInstructionsIT ?? '',
                        style: AppStyle.bodyStyle()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                    Text(AppString.description, style: AppStyle.headerStyle()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.drinkModel!.strInstructionsDE ?? '',
                        style: AppStyle.bodyStyle()),
                  ),
                ],
              ),
            ),
          );
        },

      ),
    );
  }
}
