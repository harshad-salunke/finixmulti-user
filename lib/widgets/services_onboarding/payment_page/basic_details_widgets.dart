import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../global/my_lable_textfield.dart';
class BasicDetialsWidget extends StatelessWidget {
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController mobileEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameEditingController.text = "Harshad salunke";
    emailEditingController.text = "harshadsalunke2002@gmail.com";
    mobileEditingController.text = "9359978498";
    return Container(
      child: Column(
        children: [
          Text(
            "Basic Details",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: MyAppColor.primary_color,
                fontFamily: 'Brand-Bold'),
          ),
          SizedBox(
            height: 5,
          ),
          MyLableTextField(
            labletext: "Name",
            hinttext: "Enter Name",
            height: 16,
            width: 20,
            radius: 10,
            textEditingController: nameEditingController,
            textInputType: TextInputType.name,
          ),
          SizedBox(
            height: 10,
          ),
          MyLableTextField(
            labletext: "Mobile",
            hinttext: "Enter Mobile Number",
            height: 16,
            width: 20,
            radius: 10,
            textEditingController: mobileEditingController,
            textInputType: TextInputType.number,
          ),
          SizedBox(
            height: 10,
          ),
          MyLableTextField(
            labletext: "Email",
            hinttext: "Enter Email",
            height: 16,
            width: 20,
            radius: 10,
            textEditingController: emailEditingController,
            textInputType: TextInputType.emailAddress,
          ),
        ],
      ),
    );
  }
}
