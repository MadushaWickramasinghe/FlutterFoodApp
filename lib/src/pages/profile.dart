import 'package:flutter/material.dart';
import 'package:food_app/widgets/custom_list.dart';
import 'package:food_app/widgets/small_btn.dart';

class Profile extends StatefulWidget {

  @override
  _ProfileState createState() => _ProfileState();

}

class _ProfileState extends State<Profile> {
  bool turnOnNotification = false;
  bool turnOnLocation = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget> [
              Text("Profile",style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),
              SizedBox(height: 20.0,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children:<Widget> [
                  Container(
                    height: 120.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(60.0),
                      boxShadow:[
                        BoxShadow(
                          blurRadius: 20.0,
                          offset: Offset(4,9),
                          color: Colors.grey,
                        )
                      ],
                      image:  DecorationImage(
                        image: AssetImage("assets/images/kottu.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    //child: Image.asset("assets/images/kottu.jpg",fit: BoxFit.cover,),
                  ),
                  SizedBox(width: 20.0,),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("User Name",style: TextStyle(fontSize: 18.0,),),
                      SizedBox(height: 5.0,),
                      Text("0713894892",style: TextStyle(color:Colors.grey),),
                      SizedBox(height: 10.0,),
                     SmallButton(
                       btnText: "Edit",
                     ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 35.0,),
              Text("Account",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w400),),
              SizedBox(height: 10.0,),
              Card(
                elevation: 3.0,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children:<Widget> [
                      CustomList(
                        icon: Icons.location_on,
                        text: "Location",
                      ),

                      Divider(height: 10.0,color: Colors.grey,),

                      CustomList(
                        icon: Icons.visibility,
                        text: "Change Password",
                      ),

                      Divider(height: 10.0,color: Colors.grey,),


                      CustomList(
                        icon: Icons.local_shipping,
                        text: "Shipping",
                      ),

                      Divider(height: 10.0,color: Colors.grey,),


                      CustomList(
                        icon: Icons.payment,
                        text: "Payment",
                      ),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 35.0,),
              Text("Notification",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w400),),
              SizedBox(height: 10.0,),
              Card(
                elevation: 3.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children:<Widget> [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:<Widget> [
                          Text("App Notification",style: TextStyle(fontSize: 15.0),),
                          Switch(
                            activeColor: Colors.orangeAccent,
                            value: turnOnNotification,
                            onChanged:(bool value){
                              setState(() {
                                turnOnNotification = value;
                              });

                            },
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:<Widget> [
                          Text("Location Tracking",style: TextStyle(fontSize: 15.0),),
                          Switch(
                            activeColor: Colors.orangeAccent,
                            value: turnOnLocation,
                            onChanged:(bool value){
                              setState(() {
                                turnOnLocation = value;
                              });

                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 35.0,),
              Text("Other",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w400),),
              SizedBox(height: 10.0,),
              
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Language",style: TextStyle(fontSize: 16.0),)
                      ],
                    ),
                  ),
                ),
              ),
            ],

          ),

        ),
      )
    );
  }
}
