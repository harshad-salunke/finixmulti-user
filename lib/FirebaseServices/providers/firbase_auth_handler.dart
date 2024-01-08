// ignore_for_file: constant_identifier_names


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';


import 'package:firebase_database/firebase_database.dart';

import '../../Models/UserModle.dart';



class FirebaseAuthHandler extends ChangeNotifier{


static  FirebaseAuth firebaseAuth=FirebaseAuth.instance;


  Future<String> signUpWithEmailAndPassword(UserModel userModel) async {
    try {
      final credential = await firebaseAuth
          .createUserWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password,
      );
        print(userModel.toJson());
        return 'created';
    } on FirebaseAuthException catch (e) {
      print(e.message);
      if (e.code == 'weak-password') {
        return 'The password provided is too weak ...!';

      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email ...!';

      }
    } catch (e) {
      return "Some Error Occurred";

      print(e);
    }
    return "Some Error Occurred";

  }

  Future<void> signInWithEmailAndPassword(String email,String password) async{
    print("inside class"+email);
    print("inside class"+password);
    FirebaseAuth firebaseAuth=FirebaseAuth.instance;
    print(firebaseAuth.currentUser?.email);
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );

    } on FirebaseAuthException catch (e) {
     print(e.message);
    }
  }



  Future signOut() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.signOut();
    return Future.delayed(Duration.zero);
  }


}





