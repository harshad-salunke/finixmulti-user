import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../widgets/global/onboarding_appbar.dart';
class ServicePaymentScreen extends StatefulWidget {
  const ServicePaymentScreen({Key? key}) : super(key: key);

  @override
  State<ServicePaymentScreen> createState() => _ServicePaymentScreenState();
}

class _ServicePaymentScreenState extends State<ServicePaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff7f7f7),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 50,
          ),
          OnBoardingAppbar(
            title: 'Payment Method',
            currentPage: 4,),
          Expanded(child: Container()),

          Container(
            height: 55,
            margin: EdgeInsets.all(10),
            child: ElevatedButton(
                onPressed: (){
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: MyAppColor.primary_light,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                    )
                ),
                child: Text(
                  "Next",
                  style: TextStyle(
                      color: MyAppColor.primary_color,
                      fontFamily: "Brand-Bold",
                      fontSize: 18
                  ),
                )),
          )
        ],
      ),
    );
  }
}
