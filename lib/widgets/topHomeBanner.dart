import 'package:flutter/material.dart';


class TopHomeBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:<Widget> [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("What Would",style: TextStyle(fontSize: 32.0,fontWeight: FontWeight.bold),),
                Text("You Like To Eat?",style: TextStyle(fontSize: 28.0,fontWeight: FontWeight.bold),),
              ],
            ),
          ],
      ),
    );
  }
}
