import 'package:finixmulti_user/allScreens/service_onboarding_screens/service_schedule_screen.dart';
import 'package:finixmulti_user/utils/app_colors.dart';
import 'package:finixmulti_user/widgets/global/onboarding_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ServiceOnBoarding extends StatefulWidget {
  const ServiceOnBoarding({Key? key}) : super(key: key);

  @override
  State<ServiceOnBoarding> createState() => _ServiceOnBoardingState();
}

class _ServiceOnBoardingState extends State<ServiceOnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff7f7f7),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          OnBoardingAppbar(
            title: 'Book your service',
            currentPage: 0,),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(25, 5, 0, 5),
            child: Text(
              "Product Details",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: MyAppColor.primary_color,
                  fontFamily: 'Brand-Bold'),
            ),
          ),

          Container(
            margin: EdgeInsets.fromLTRB(25, 5, 0, 5),
            child: Text(
              "This Product You Purchase From Finixmulti Electrical ?",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Brand-Bold'),
            ),
          ),

          SizedBox(
            height: 10,
          ),
          Container(
            height: 40,
            width: 150,
            margin: EdgeInsets.fromLTRB(25, 5, 0, 5),

            child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ServiceScheduleScreen()));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: MyAppColor.primary_color,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
                child: Text(
                  "Yes",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Brand-Bold",
                      fontSize: 20
                  ),
                )),
          ),
          Container(
            height: 40,
            width: 150,
            margin: EdgeInsets.fromLTRB(25, 5, 0, 5),

            child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ServiceScheduleScreen()));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: MyAppColor.primary_color,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
                child: Text(
                  "No",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Brand-Bold",
                      fontSize: 20
                  ),
                )),
          ),


          Expanded(child: Container()),

        ],
      ),

    );
  }
}
