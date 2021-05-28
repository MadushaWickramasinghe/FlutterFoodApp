import 'package:flutter/material.dart';
import 'package:food_app/models/food_model.dart';
import 'package:food_app/src/scoped/main_model.dart';
import 'package:food_app/widgets/foodItemcard.dart';
import 'package:food_app/widgets/small_btn.dart';
import 'package:scoped_model/scoped_model.dart';

class Favorite extends StatefulWidget {
  final MainModel model ;

  Favorite({this.model});

  @override
  _FavoriteState createState() => _FavoriteState();
}


class _FavoriteState extends State<Favorite> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.model.fetchFoods();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.white,
      body: ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child,MainModel model){
         // model.fetchFoods(); //this will fetch and notifylisteners()
          List<Food> foods = model.foods;
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: RefreshIndicator(
              onRefresh: model.fetchFoods,
              child: ListView(
                children:foods.map(
                    (Food food){
                      return FoodItemCard(
                        food.name,
                        food.description,
                        food.price.toString(),
                      );
                    },
                ).toList(),
              ),
            ),
          );
        },
      )

    );
  }
}
