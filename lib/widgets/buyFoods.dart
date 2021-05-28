import 'package:flutter/material.dart';
import 'package:food_app/models/food_model.dart';
import 'package:food_app/src/data/food_data.dart';
import 'package:food_app/src/pages/foodDetails.dart';
import 'package:food_app/widgets/button.dart';

class BuyFoods extends StatefulWidget {
  final String id;
  final String name;
  final String imagePath;
  final String category;
  final String price;
  final String discount;
  final double ratings;

  final Food food;


  BuyFoods({this.id,this.name,this.imagePath,this.category,this.price,this.discount,this.ratings, this.food});
  @override

  _BuyFoodsState createState() => _BuyFoodsState();
}

class _BuyFoodsState extends State<BuyFoods> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Stack(
        children:<Widget> [
          Container(
            height: 200.0,
            width: 340.0,
            child: Image.asset(widget.imagePath,fit: BoxFit.cover,),
          ),
          Positioned(
            left: 0.0,
            bottom: 0.0,
            child: Container(
              height: 90.0,
              width: 340.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black,Colors.black12
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                )
              ),
            ),
          ),
          Positioned(
            left: 10.0,
            bottom: 10.0,
            right: 10.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:<Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:<Widget> [
                    Text(widget.name,style:
                    TextStyle(color: Colors.white,fontSize: 18.0,fontWeight: FontWeight.bold),),
                    Row(
                      children:<Widget> [
                        Icon(Icons.star,color:Theme.of(context).primaryColor,size: 16.0,),
                        Icon(Icons.star,color:Theme.of(context).primaryColor,size: 16.0,),
                        Icon(Icons.star,color:Theme.of(context).primaryColor,size: 16.0,),
                        Icon(Icons.star,color:Theme.of(context).primaryColor,size: 16.0,),

                      ],
                    ),
                    // Row(
                    //   children: [
                    //     GestureDetector(
                    //       onTap: (){
                    //         Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> FoodDetails(
                    //         )));
                    //       },
                    //
                    //         child: Center(child: Text("View Food Details",style: TextStyle(color: Colors.white ,fontSize: 18.0),))),
                    //   ],
                    // ),

                  ],
                ),
                Column(
                  children:<Widget> [
                    Text(widget.price.toString(),
                    style: TextStyle(color: Colors.orangeAccent),),
                    Text("Min Order",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
