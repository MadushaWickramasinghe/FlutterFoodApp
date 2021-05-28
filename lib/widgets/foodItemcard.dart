import 'package:flutter/material.dart';
import 'package:food_app/widgets/small_btn.dart';

class FoodItemCard extends StatelessWidget {

  final String title;
  final String description;
  //final String category,
  final String price;
  //final String discount,

  FoodItemCard(this.title, this.description, this.price);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.all( 10.0),
      width: MediaQuery.of(context).size.width,
      height: 150.0,

      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
                blurRadius: 5.0,
                offset: Offset(0.0, 2 ),
                color: Colors.grey
            )
          ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10.0),
            width: 80.0,
            height: 110.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/hoppers.jpg"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
              Text("$title",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
              SizedBox(height: 15.0,),
              Container(
                width: 200.0,
                child: Text("$description "),
              ),
              SizedBox(height: 15.0,),
              Container(
                width: 170,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:<Widget> [
                    Text("Rs: $price",style: TextStyle(color: Colors.orangeAccent,fontSize:18.0),),
                    SmallButton(
                      btnText: "Buy",
                    ),

                  ],
                ),
              ),
            ],
          ),
        ],
      ),

    );
  }
}
