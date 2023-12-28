import 'package:finixmulti_user/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class OnBoardingAppbar extends StatelessWidget {
  const OnBoardingAppbar({required this.title, required this.currentPage});
  final int currentPage;
 final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 40,
                margin: EdgeInsets.only(left: 10),
                child: IconButton(

                    icon: const Icon(
                        Icons.arrow_back_outlined,
                      size: 28,
                      color:Color(0xff9e0093),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                title,
                style:TextStyle(
                  color: MyAppColor.primary_color,
                    fontFamily: "Brand-Bold",

                    fontSize: 23, fontWeight: FontWeight.bold,

                ),
              ),
            ],
          ),
        SizedBox(
          height:15 ,
        ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 30,
              ),
              for(int i=0;i<4;i++)
                Expanded(
                  child: Container(
                    height: 10,
                    margin: EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                        color: i<=currentPage?Color(0xff9e0093):Colors.purple.withOpacity(0.3),
                        borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                  ),
                ),

            ],
          )


        ],
      ),
    );
  }


}
