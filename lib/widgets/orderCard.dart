import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:<Widget> [
            Container(
              height: 75.0,
              width: 45.0,
              decoration: BoxDecoration(
                border: Border.all(width: 2.0,color: Colors.orangeAccent),
                borderRadius: BorderRadius.circular(15.0)
              ),
              child: Column(
                children:<Widget> [
                  InkWell(
                      onTap:(){

                      },
                      child: Icon(Icons.keyboard_arrow_up)
                  ),
                  Text("0",style: TextStyle(fontSize: 15.0),),
                  InkWell(
                      onTap:(){

                      },
                      child: Icon(Icons.keyboard_arrow_down)
                  ),

                ],
              ),
            ),
            SizedBox(
              width: 15.0,
            ),
            Container(
              height: 70.0,
              width: 70.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/kottu.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(50.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 20.0,
                    offset: Offset(2.0, 5.0),
                  )
                ]
              ),
            ),
            SizedBox(width: 20.0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:<Widget> [
                Text("Kottu",style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),),
                SizedBox(height: 10.0,),
                Text("Rs:250",style: TextStyle(color: Colors.orangeAccent,fontSize: 18.0),),
                SizedBox(height: 10.0,),
                Container(
                  height: 25.0,
                  width: 140.0,
                  child: ListView(
                    children:<Widget> [
                      Row(
                        children:<Widget> [
                          Text("Chicken",style: TextStyle(fontSize: 15.0,color: Colors.grey),),
                          InkWell(
                              onTap: (){

                              },
                              child: Text(" X ",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)),
                          Text("Cheese",style: TextStyle(fontSize: 15.0,color: Colors.grey),),
                          InkWell(
                              onTap: (){

                              },
                              child: Text(" X ",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)),

                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            GestureDetector(
              onTap: (){

              },
              child: Icon(Icons.cancel,color: Colors.grey,),
            ),
          ],

        ),
      ),
    );
  }
}
