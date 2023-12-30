import 'package:finixmulti_user/utils/app_colors.dart';
import 'package:finixmulti_user/widgets/global/my_elevated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomPaymentButton extends StatelessWidget {
  Function() onPressed;

  BottomPaymentButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 10, 10, 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
                color: Colors.black,
                blurRadius: 10.0,
                spreadRadius: 0.5,
                offset: Offset(0.7, 0.7))
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "₹ 200",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Brand-Bold'),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: MyElevatedButton(
                title: "Proceed",
                height: 45,
                width: double.infinity,
                fontsize: 18,
                radius: 5,
                bg_color: MyAppColor.primary_color,
                fontWeight: FontWeight.w100,
                onPressed: onPressed),
          )
        ],
      ),
    );
  }
}
