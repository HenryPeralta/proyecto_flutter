import 'package:flutter/material.dart';

class LoginController {

  static String username = "";
  static String password = "";

  void login(BuildContext context) {

    if(username == "admin" && password == "12345"){

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login Correcto"))
      );

    }else{

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Credenciales incorrectas"))
      );

    }

  }

}