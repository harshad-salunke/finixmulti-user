import 'package:flutter/material.dart';

class Logincontroller{

  TextEditingController email_Controller = TextEditingController();
  TextEditingController password_Controller = TextEditingController();

  bool isValid(){

    if(!email_Controller.text.endsWith("@gamil.com")){
      return false;
    }
    if(password_Controller.text.length<6){
      return false;
    }
    return true;
  }




}