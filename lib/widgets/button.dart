import 'package:flutter/material.dart';

class Button extends StatelessWidget {

  final String btntext;

  Button({this.btntext});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.orangeAccent,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 1),
              offset: Offset(0.0, 0.0),
              blurRadius: 0.0,
            )
          ]
      ),
      child: Center(
        child: Text("$btntext",style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
