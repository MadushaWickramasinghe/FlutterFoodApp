import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final String categoryName;
  final String imagePath;
  final int numberOfItems;

  FoodCard({this.categoryName,this.imagePath,this.numberOfItems});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 80.0),
        child: Row(
          children:<Widget> [
            Image(
              image: AssetImage(imagePath),
              height: 65.0,
              width: 65.0,
            ),
            SizedBox(width: 20.0,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget> [
                Text(categoryName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),),
                Text("$numberOfItems Kinds",),
              ],
            )
          ],
        ),
      ),
    );
  }
}
