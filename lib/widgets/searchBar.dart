import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Material(
        elevation: 8.0,
        borderRadius: BorderRadius.circular(30.0),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 32.0,vertical: 14 ),
            hintText: "Search Here",
            suffixIcon: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(20.0),
              child: Icon(
                  Icons.search,
                  color: Colors.black,

              ),
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
