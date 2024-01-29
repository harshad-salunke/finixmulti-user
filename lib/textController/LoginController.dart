import 'package:flutter/material.dart';

class Logincontroller{

  TextEditingController email_Controller = TextEditingController();
  TextEditingController password_Controller = TextEditingController();
  String isValid(){


    if(!email_Controller.text.endsWith("@gmail.com")){
      return "Please Enter Correct Email ...!";
    }

    if(password_Controller.text.length<6){
      return "Please Enter Correct Password ...!";
    }

    return "true";
  }


  Map<String,String> getUserData(){
    Map<String,String> data={
      'email':email_Controller.text,
      'password':password_Controller.text
    };
    return data;
  }




}