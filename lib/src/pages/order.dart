import 'package:flutter/material.dart';
import 'package:food_app/src/pages/signIn.dart';
import 'package:food_app/widgets/orderCard.dart';

class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar:AppBar(
      //   title: Text("Food Card",style: TextStyle(color: Colors.orangeAccent),),
      //   elevation: 0.0,
      //   centerTitle: true,
      //   backgroundColor: Colors.white,
      //
      // ),

      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        scrollDirection: Axis.vertical,
        children:<Widget> [
          OrderCard(),
          OrderCard(),
          OrderCard(),
          OrderCard(),
        ],
      ),
      bottomNavigationBar: _buildTotalContainer(),
    );
  }

  Widget _buildTotalContainer(){
   return Container(
     height: 260.0,
     margin: EdgeInsets.only(top: 20.0),
     padding: EdgeInsets.symmetric(horizontal: 20.0),
     child: Column(
       children:<Widget> [
         SizedBox(height: 10.0,),

         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children:<Widget> [
             Text("Total Balance",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.grey),),
             Text("250.00",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.grey.shade600),),
           ],
         ),

         SizedBox(height: 10.0,),


         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children:<Widget> [
             Text("Discount",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.grey),),
             Text("0.00",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.grey.shade600),),
           ],
         ),

         SizedBox(height: 10.0,),

         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children:<Widget> [
             Text("Tax",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.grey),),
             Text("0.00",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.grey.shade600),),
           ],
         ),

         SizedBox(height: 10.0,),

         Divider(height: 20.0,color: Colors.grey,),

         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children:<Widget> [
             Text("SubTotal",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.grey),),
             Text("250.00",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.grey.shade600),),
           ],
         ),

         SizedBox(height: 20.0,),

         GestureDetector(
           onTap: (){
             Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> SignIn()));
           },
           child: Container(
             width: MediaQuery.of(context).size.width,
             height: 50.0,
             decoration: BoxDecoration(
               color: Colors.orangeAccent,
               borderRadius: BorderRadius.circular(30.0)

             ),
             child: Center(
               child: Text("Proceed To CheckOut",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.white),)

             ),
           ),
         ),

       ],
     ),
   );
  }
}
