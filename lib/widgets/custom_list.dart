import 'package:flutter/material.dart';

class CustomList extends StatelessWidget {

  final IconData icon;
  final String text;

  CustomList({this.icon, this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children:<Widget> [
          Icon(
            icon,
            color: Colors.orangeAccent,
          ),
          SizedBox(width: 15.0,),
          Text(
            "$text",
            style: TextStyle(fontSize: 15.0),),
        ],
      ),

    );
  }
}
