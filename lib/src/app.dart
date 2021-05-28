import 'package:flutter/material.dart';
import 'package:food_app/src/admin/adminPages/addFoodItems.dart';
import 'package:food_app/src/scoped/food_model.dart';
import 'package:food_app/src/scoped/main_model.dart';
import 'package:food_app/src/screens/mainScreen.dart';
import 'package:scoped_model/scoped_model.dart';

class App extends StatelessWidget {

 final MainModel mainModel = MainModel();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
      model: mainModel,
      child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Food Ordering App",
            theme: ThemeData(
            primaryColor: Colors.orangeAccent),
            home: MainScreen(model: mainModel),
            //home: AddFoodItems(),
      ),
    );
  }
}
