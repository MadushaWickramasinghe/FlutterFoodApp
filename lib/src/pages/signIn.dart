import 'package:flutter/material.dart';
import 'package:food_app/src/pages/signUp.dart';
import 'package:food_app/widgets/button.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  bool _toogleVisibility = true;

  Widget _buildEmailTextField(){
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Your Email Or Username",
        hintStyle: TextStyle(color: Colors.grey,fontSize: 18.0)
      ),
    );
  }

  Widget _buildPasswordTextField(){
    return TextFormField(
      decoration: InputDecoration(
          hintText: "Your Password",
          hintStyle: TextStyle(color: Colors.grey,fontSize: 18.0),
        suffixIcon: IconButton(
          onPressed: (){
            setState(() {
              _toogleVisibility = !_toogleVisibility;
            });
          },
          icon: _toogleVisibility ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
        ),
      ),
      obscureText: _toogleVisibility,

    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget> [
            Text("Sign In",style: TextStyle(fontSize: 45.0,fontWeight: FontWeight.bold,),),
            SizedBox(height: 20.0,),

            Card(
              elevation: 8.0,
              child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  children:<Widget> [
                    _buildEmailTextField(),
                    SizedBox(height: 20.0,),
                    _buildPasswordTextField(),
                  ],
                ),
              ),
            ),

            SizedBox(height: 10.0,),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text("Forgotten Password?",style: TextStyle(fontSize: 15.0,color: Colors.orangeAccent,fontWeight: FontWeight.bold),)
              ],
            ),

            SizedBox(height: 20.0,),

            Button(btntext: "SignIn",),

            SizedBox(height: 10.0,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Don't have account?"),
                GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => SignUp()));
                    },
                    child: Text("  Sign Up",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0,color: Colors.orangeAccent),)),
              ],
            ),


          ],
        ),
      ),
    );
  }
}
