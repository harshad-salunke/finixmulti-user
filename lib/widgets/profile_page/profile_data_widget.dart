import 'package:finixmulti_user/FirebaseServices/providers/services_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../textController/RegistrationController.dart';
import '../../utils/app_colors.dart';

class ProfileDataWidget extends StatelessWidget {
  bool isReadOnly;
  double width;
  double height;

  ProfileDataWidget({required this.isReadOnly, this.width = 15.0, this.height = 13.0});

  RegistrationController registrationController = RegistrationController();

  @override
  Widget build(BuildContext context) {
    return Consumer<ServiceProvider>(builder:(_,serviceProvider,__){
      registrationController.setData(serviceProvider.userData);
      return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            TextField(
              controller: registrationController.full_nameController,
              keyboardType: TextInputType.text,
              readOnly: isReadOnly,
              decoration: InputDecoration(
                fillColor: Colors.white,
                prefixIcon: Icon(
                  Icons.person,
                  size: 25,
                ),
                filled: false,
                labelText: "Full Name",
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  vertical: height,
                  horizontal: width,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyAppColor.primary_color),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyAppColor.primary_color),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: MyAppColor.primary_color),
                ),
              ),
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Brand-Bold",
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 15,
            ),

            TextField(
              controller: registrationController.email_Controller,
              keyboardType: TextInputType.text,
              readOnly: isReadOnly,
              decoration: InputDecoration(
                fillColor: Colors.white,
                prefixIcon: Icon(
                  Icons.email_outlined,
                  size: 25,
                ),
                filled: false,
                labelText: "Email",
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  vertical: height,
                  horizontal: width,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyAppColor.primary_color),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyAppColor.primary_color),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: MyAppColor.primary_color),
                ),
              ),
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Brand-Bold",
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 15,
            ),

            TextField(
              controller: registrationController.mobile_controller,
              keyboardType: TextInputType.text,
              readOnly: isReadOnly,
              decoration: InputDecoration(
                fillColor: Colors.white,
                prefixIcon: Icon(
                  Icons.call,
                  size: 25,
                ),
                filled: false,
                labelText: "Mobile",
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  vertical: height,
                  horizontal: width,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyAppColor.primary_color),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyAppColor.primary_color),
                ),
                prefixText: '+91',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: MyAppColor.primary_color),
                ),
              ),
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Brand-Bold",
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 15,
            ),

            TextField(
              controller: registrationController.gender_Controller,
              keyboardType: TextInputType.text,
              readOnly: isReadOnly,
              decoration: InputDecoration(
                fillColor: Colors.white,
                prefixIcon: Icon(
                  Icons.transgender,
                  size: 25,
                ),
                filled: false,
                labelText: "Gender",
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  vertical: height,
                  horizontal: width,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyAppColor.primary_color),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyAppColor.primary_color),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: MyAppColor.primary_color),
                ),
              ),
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Brand-Bold",
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                  text: "Finixmulti electrical ",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ]),
            ),
          ],
        ),
      );
    });
  }
}
