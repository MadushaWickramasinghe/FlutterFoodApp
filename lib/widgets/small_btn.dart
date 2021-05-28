import 'package:flutter/material.dart';

class SmallButton extends StatelessWidget {

  final String btnText;

  SmallButton({this.btnText});
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 30.0,
      width: 80.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.orangeAccent,
        ),
        //color: Colors.orangeAccent,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Center(
          child: Text("$btnText",style: TextStyle(color: Colors.orangeAccent,fontSize: 18.0),)),
    );
  }
}
