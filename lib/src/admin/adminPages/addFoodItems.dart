import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:food_app/models/food_model.dart';
import 'package:food_app/src/scoped/main_model.dart';
import 'package:food_app/widgets/button.dart';
import 'package:scoped_model/scoped_model.dart';


class AddFoodItems extends StatefulWidget {
  @override
  _AddFoodItemsState createState() => _AddFoodItemsState();
}

class _AddFoodItemsState extends State<AddFoodItems> {

  String title;
  String description;
  String price;
  String discount;
  String category;

  GlobalKey<FormState> _foodItemFormKey = GlobalKey();
  GlobalKey<ScaffoldState> _scaffoldStateKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldStateKey,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 80.0,horizontal: 16.0),
          // width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,

          child:Form(
            key: _foodItemFormKey,
            child: Column(
              children:<Widget> [

                Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  width: MediaQuery.of(context).size.width,
                  height: 150.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                      image: AssetImage("assets/images/noimage.png"),
                    )
                  ),

                ),
                _buildTextFormField("Food Title"),
                _buildTextFormField("Category"),
                _buildTextFormField("Description",maxLine: 4),
                _buildTextFormField("Price"),
                _buildTextFormField("Discount"),


                SizedBox(height: 40.0,),

                ScopedModelDescendant  (
                  builder: (BuildContext context, Widget child, MainModel model){
                    return GestureDetector (
                      onTap: (){
                        onSubmit(model.addFood);
                        if(model.Loading){
                          //show loading indicator
                          showLoadingIndicator();
                        }
                      },

                        child: Button(btntext: "Add Food Item",)
                    );
                  },
                )

              ],
            ),
          )


        ),
      ),
    );
  }

  void onSubmit(Function addFood) async{
      if(_foodItemFormKey.currentState.validate()){
        _foodItemFormKey.currentState.save();

        final Food food = Food(
          name: title,
          category: category,
          description: description,
          price: price,
          discount: discount,
        );
         bool value = await addFood(food);
         if(value){
           Navigator.of(context).pop();
           SnackBar snackBar = SnackBar(
             content: Text("Food Item Added Successfully"),
           );
           _scaffoldStateKey.currentState.showSnackBar(snackBar);
         }else if(!value){
           Navigator.of(context).pop();
           SnackBar snackBar = SnackBar(
             content: Text(" Failed to Add Food Item "),
           );
           _scaffoldStateKey.currentState.showSnackBar(snackBar);

         }
    };
  }

  Future <void> showLoadingIndicator(){
        return showDialog(
            context: context,
          barrierDismissible: false,
          builder: (BuildContext context){
              return AlertDialog(
                content: Row(
                  children:<Widget> [
                    CircularProgressIndicator(),
                    SizedBox(width: 10.0,),
                    Text("Adding Food Items..."),
                  ],
                ),
              );
          }
        );
  }

  Widget _buildTextFormField(String hint,{int maxLine = 1}) {

    return TextFormField(
      decoration: InputDecoration(hintText: "$hint"),
      maxLines: maxLine,
      keyboardType: hint == "Price" || hint == "Discount"
          ? TextInputType.number
          : TextInputType.text,

      validator: (String value) {

        if (value.isEmpty && hint == "Food Title") {
          return"The Food Title is required";
        }

        if (value.isEmpty && hint == "Category") {
          return "The category is required";
        }

        if (value.isEmpty && hint == "Description") {
          return "The Description is required";
        }

        if (value.isEmpty && hint == "Price") {
          return  "The price is required";
        }
        },

      onChanged: (String value) {
        if (hint == "Food Title") {
          title = value;
        }

        if (hint == "Category") {
          category = value;
        }

        if (hint == "Description") {
          description = value;
        }

        if (hint == "price") {
          price = value;
        }

        if (hint == "discount") {
          discount = value;

        }
      },
    );
  }
}
