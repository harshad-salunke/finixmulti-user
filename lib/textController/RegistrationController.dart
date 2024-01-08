import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Models/UserModle.dart';

class RegistrationController {
  TextEditingController mobile_controller = TextEditingController();
  TextEditingController full_nameController = TextEditingController();
  TextEditingController email_Controller = TextEditingController();
  TextEditingController password_Controller = TextEditingController();
  TextEditingController gender_Controller=TextEditingController();

  String isValid(){
    if(full_nameController.text.isEmpty){
      return "Please enter full name ...!";
    }

    if(!email_Controller.text.endsWith("@gmail.com")){
      return "Please Enter Correct Email ...!";
    }
    if(mobile_controller.text.length<10 || mobile_controller.text.length>10){
      return "Please Enter Correct Mobile Number ...!";
    }
    // if(password_Controller.text.length<){
    //   return "Password Must Be At Least 6 Characters Long ...!";
    // }
    if(gender_Controller.text.isEmpty){
      return "Please Select You Gender ...!";
    }
    return "true";
  }


  UserModel getUserData(){
    return UserModel(phone_number: mobile_controller.text, name: full_nameController.text, uid: "", register_date: "", gender: gender_Controller.text, email: email_Controller.text, password: password_Controller.text,);
  }




}