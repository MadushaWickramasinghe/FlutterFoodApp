import 'package:flutter/material.dart';
import 'package:food_app/models/food_model.dart';
import 'package:food_app/widgets/button.dart';

class FoodDetails extends StatelessWidget {
  final Food food;

  FoodDetails({this.food});
  var _mediumSpace = SizedBox(height: 20.0,);
  var  _SmallSpace = SizedBox(height: 10.0,);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:Colors.white ,
          title: Text("Food Details",style: TextStyle(color: Colors.orangeAccent,)),
          centerTitle: true,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.orangeAccent),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget> [
              Container(
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                child: Image.asset("assets/images/friedrice.jpg",fit: BoxFit.cover,),
              ),
              _mediumSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:<Widget> [
                  Text(food.name,style: TextStyle(fontSize: 20.0, ),),
                  Text(food.price,style: TextStyle(fontSize: 20.0, ),),
                ],
              ),
              _mediumSpace,
              Text("Description:",style: TextStyle(fontSize: 20.0, ),),
              _SmallSpace,
              Text("${food.description}"
                ,textAlign: TextAlign.justify,),
              _SmallSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget> [
                  IconButton(icon: Icon(Icons.add_circle,size: 30.0,), onPressed: null,),
                  SizedBox(width: 20.0,),
                  Text("1",style: TextStyle(fontSize: 18.0),),
                  SizedBox(width: 20.0,),
                  IconButton(icon: Icon(Icons.remove_circle,size: 30.0,), onPressed: null,),
                ],
              ),
              _SmallSpace,
              Button(btntext: "Add to Cart",),
            ],
          ),
        ),
      ),
    );
  }
}
