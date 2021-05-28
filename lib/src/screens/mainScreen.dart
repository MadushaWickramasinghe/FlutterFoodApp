import 'package:flutter/material.dart';
import 'package:food_app/src/admin/adminPages/addFoodItems.dart';
import 'package:food_app/src/pages/explore.dart';
import 'package:food_app/src/pages/homePage.dart';
import 'package:food_app/src/pages/order.dart';
import 'package:food_app/src/pages/profile.dart';
import 'package:food_app/src/scoped/food_model.dart';
import 'package:food_app/src/scoped/main_model.dart';


class MainScreen extends StatefulWidget {
  final MainModel model;

  MainScreen({this.model});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int currentTabIndex = 0;

  HomePage homePage;
  Order order;
  Favorite favorite;
  Profile profile;

  List<Widget> pages;
  Widget currentPage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //widget.foodModel.fetchFoods();
    // call the fetch method

    //widget.model.fetchFoods();

    homePage = HomePage();
    order = Order();
    favorite = Favorite( model: widget.model);
    profile = Profile();
    pages = [homePage,favorite,order,profile];

    currentPage = homePage;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.orangeAccent),
          title: Text(
            currentTabIndex == 0
                ? "Food App"
                : currentTabIndex == 1
                ? "All Food Items"
                : currentTabIndex == 2
                ? "Orders"
                : "Profile",
            style: TextStyle(
                color: Colors.orangeAccent,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                icon: Padding(
                  padding: EdgeInsets.only(right: 30.0),
                    child: Icon(Icons.notifications_none,size: 35.0,color: Colors.orangeAccent,)),
                onPressed: (){

                },
            ),

            IconButton(
              icon: _buildShoppingCart(),
              onPressed: (){

              },
            )
          ],
        ),
        drawer: Drawer(
          child: Column(
            children:<Widget> [
              ListTile(
                onTap: (){
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                    MaterialPageRoute(builder:(BuildContext) => AddFoodItems() )

                  );
                },
                leading: Icon(Icons.add),
                title: Text("Add Food Item",style: TextStyle(fontSize: 16.0),),
              ),
            ],
          ),


        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index){
            setState(() {
              currentTabIndex = index;
              currentPage = pages[index];
            });

          },
          currentIndex: currentTabIndex,
          type: BottomNavigationBarType.fixed,
         items: <BottomNavigationBarItem>[
           BottomNavigationBarItem(
             icon: Icon(Icons.home),
             title: Text("Home")
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.favorite),
             title: Text("Explore"),
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.shopping_cart),
             title: Text("Orders")
           ),

           BottomNavigationBarItem(
             icon: Icon(Icons.person),
             title: Text("Profile")
           ),

         ],

        ),

        body:currentPage ,

      ),
    );
  }

  Widget _buildShoppingCart(){
    return Stack(
      children:<Widget> [
        Container(),
        Padding(
            padding: EdgeInsets.only(right: 30.0),
            child: Icon(Icons.shopping_cart,size: 35.0,color: Colors.orangeAccent,)),

        Positioned(
          right: 1.0,
          child: Container(
            height: 15.0,
            width: 15.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.blue
            ),
            child: Center(
              child: Text("1",style: TextStyle(fontSize: 12.0,color: Colors.white),),
            ),
            
          ),
        ),
      ],
    );

}
}
