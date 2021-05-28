import 'package:flutter/material.dart';
import 'package:food_app/src/data/food_data.dart';
import 'package:food_app/src/pages/foodDetails.dart';
import 'package:food_app/src/scoped/food_model.dart';
import 'package:food_app/src/scoped/main_model.dart';
import 'package:food_app/widgets/buyFoods.dart';
import 'package:food_app/widgets/food_category.dart';
import 'package:food_app/widgets/searchBar.dart';
import 'package:food_app/widgets/topHomeBanner.dart';
import 'package:food_app/models/food_model.dart';
import 'package:scoped_model/scoped_model.dart';


class HomePage extends StatefulWidget {
  //final FoodModel foodModel;

 // HomePage(this.foodModel);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   //List<Food> _foods = foods;

  @override
  void initState() {
    //widget.foodModel.fetchFoods();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.only(left: 30.0,right: 20.0),
        children:<Widget> [
          TopHomeBanner(),
          // FoodCategory(),
          SearchBar(),
          SizedBox(height: 20.0,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:<Widget> [
              Text("Frequently Bought Foods",style:
              TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),

              GestureDetector(
                onTap: (){

                },
                child: Text("View All",style:
                TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.orangeAccent),),
              ),
            ],
          ),

          SizedBox(height: 20.0,),
          ScopedModelDescendant<MainModel>(
            builder: (BuildContext context, Widget child, MainModel model){
               return Column(
                children:model.foods.map(_buildFoodItems).toList(),
              );
            },
          ),

        ],
      ),
    );
  }
   Widget _buildFoodItems( Food food) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context ) => FoodDetails(
            food: food,
          )
        ),);
      },
     child: Container(
           margin: EdgeInsets.only(bottom: 20.0),
           child: BuyFoods(
             id: food.id,
             name: food.name,
             imagePath: "assets/images/friedrice.jpg",
             category: food.category,
             discount: food.discount,
             price: food.price,
             ratings: food.ratings,
           ),
         ),
    );
   }



}

