import 'package:flutter/material.dart';
import 'package:food_app/src/pages/signIn.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  bool _toogleVisibility = true;
  //bool _toogleConfirmVisibilty = true;

  String _email;
  String _username;
  String _password;
  //String _confirmPassword;

  GlobalKey <FormState> _formKey = GlobalKey();


  Widget _buildEmailTextField(){
    return TextFormField(
      decoration: InputDecoration(
          hintText: "Username",
          hintStyle: TextStyle(color: Colors.grey,fontSize: 18.0)
      ),
      onSaved: (String username){
        _username = username.trim();
      },
      validator: (String username){
        String errorMessage;
        if(username.isEmpty){
          errorMessage ="UserName is Required";
        }
        if(username.length > 8){
          errorMessage = "UserName is To Short";
        }
        return errorMessage;
      },
    );
  }

  Widget _buildUserNameTextField(){
    return TextFormField(
      decoration: InputDecoration(
          hintText: "Email",
          hintStyle: TextStyle(color: Colors.grey,fontSize: 18.0)
      ),
      onSaved: (String email){
        _email = email;
      },
      validator: (String email){
        String errorMessage;
        if(!email.contains("@")){
          errorMessage="Email is incorrect";
        }
        if(email.isEmpty){
          errorMessage="Your Email is required";
        }
        return errorMessage;
      },
    );
  }

  Widget _buildPasswordTextField(){
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Password",
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
      onSaved:(String password){
        _password = password;
      },

      validator: (String password){
        String errorMassage;
        if(password.isEmpty){
          errorMassage = "Password is Required";
        }

        return errorMassage;
      },

    );
  }

  // Widget _buildConfirmPasswordTextField(){
  //   return TextFormField(
  //     decoration: InputDecoration(
  //       hintText: "Confirm Password",
  //       hintStyle: TextStyle(color: Colors.grey,fontSize: 18.0),
  //       suffixIcon: IconButton(
  //         onPressed: (){
  //           setState(() {
  //             _toogleConfirmVisibilty = !_toogleConfirmVisibilty;
  //           });
  //         },
  //         icon: _toogleConfirmVisibilty ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
  //       ),
  //     ),
  //     obscureText: _toogleConfirmVisibilty,
  //     onSaved: (String value){
  //
  //     },
  //
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
              Text("Sign Up",style: TextStyle(fontSize: 45.0,fontWeight: FontWeight.bold,color: Colors.orangeAccent),),
              SizedBox(height: 20.0,),

              Card(
                elevation: 8.0,
                child: Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children:<Widget> [
                      _buildUserNameTextField(),
                      SizedBox(height: 20.0,),
                      _buildEmailTextField(),
                      SizedBox(height: 20.0,),
                      _buildPasswordTextField(),
                      SizedBox(height: 20.0,),
                     // _buildConfirmPasswordTextField(),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 30.0,),




              _buildSignUpBtn(),
              SizedBox(height: 10.0,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Already have an account?"),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => SignIn()));
                    },
                      child: Text("  Sign In",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0,color: Colors.orangeAccent),)),
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpBtn(){
    GestureDetector(
      onTap: (){
        onSubmit();

      },
      child: Container(
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
          child: Text("Sign In Here!",style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }

  void onSubmit(){
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();

      print("email: $_email , password: $_password");
    }

  }
}
