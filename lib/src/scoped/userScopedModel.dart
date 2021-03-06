import 'dart:io';

import 'package:food_app/models/userModel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserModel extends Model{
  User _authenticatedUser;

  void authenticat (String email, String password)async{

    Map<String,dynamic> authData = {
      "email" : email,
      "password" : password,
      "returnSecureToken" : true,
    };
    try{

      http.Response response = await http.post(
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyADxd6wGCb09FBZnT231sU8cODgOvYnWSo",
      body: json.encode(authData),
        headers: {'Content-Type ' : 'application/json'},
      );

      print("print responce body: ${response.body}");
    }catch(error){
      print("The error signing up : $error");

    }

  }
}