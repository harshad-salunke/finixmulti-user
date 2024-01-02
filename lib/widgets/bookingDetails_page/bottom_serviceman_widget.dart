import 'package:finixmulti_user/allScreens/serviceman_details_screen.dart';
import 'package:finixmulti_user/utils/app_colors.dart';
import 'package:finixmulti_user/widgets/services_onboarding/location_add_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'booking_progress_indicator.dart';

class BottomServiceManWidget extends StatefulWidget {
  const BottomServiceManWidget({Key? key}) : super(key: key);

  @override
  State<BottomServiceManWidget> createState() => _BottomServiceManWidgetState();
}

class _BottomServiceManWidgetState extends State<BottomServiceManWidget> {
  bool isMinimized = false;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black,
                  blurRadius: 10.0,
                  spreadRadius: 0.5,
                  offset: Offset(0.7, 0.7))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            GestureDetector(
              onTap: () {
                isMinimized = !isMinimized;
                setState(() {

                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(isMinimized ?"Expand":"Minimize"),
                  Icon(isMinimized
                      ? Icons.arrow_drop_up_outlined
                      : Icons.arrow_drop_down_outlined),
                ],
              ),
            ),
            isMinimized?SizedBox(height: 10,):Container(),
         isMinimized?Container(): Container(
           child: SingleChildScrollView(
             child: Column(
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     BookingProgressIndicator(
                         isFirst: true,
                         isLast: false,
                         isPast: true,
                         text: "Received"),
                     BookingProgressIndicator(
                         isFirst: false,
                         isLast: false,
                         isPast: true,
                         text: "Almost ready"),
                     BookingProgressIndicator(
                         isFirst: false, isLast: true, isPast: false, text: "Ready"),
                   ],
                 ),
                 SizedBox(
                   height: 10,
                 ),
                 Row(
                   children: [
                     SizedBox(
                       width: 15,
                     ),
                     Text(
                       "Service Man Details",
                       style: TextStyle(fontFamily: "Brand-Bold", fontSize: 15),
                     ),
                     Expanded(child: Container()),
                     InkWell(
                       onTap: (){
                            Navigator.pushNamed(context, ServicemanDetailsScreen.routPaht);
                       },
                       child: Text("View Details",
                           style: GoogleFonts.roboto(
                             color: MyAppColor.primary_color,
                             fontWeight: FontWeight.bold,
                             fontSize: 15,
                           )),
                     ),
                     SizedBox(
                       width: 15,
                     ),
                   ],
                 ),
                 Divider(
                   color: MyAppColor.white_light,
                 ),
                 Column(
                   children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         SizedBox(
                           width: 20,
                         ),
                         CircleAvatar(
                           backgroundImage: AssetImage("assets/images/harshad.png"),
                           radius: 25,
                         ),
                         SizedBox(
                           width: 10,
                         ),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text("Harshad Salunke",
                                 style: GoogleFonts.roboto(
                                   color: Colors.black,
                                   fontWeight: FontWeight.w500,
                                   fontSize: 15,
                                 )),
                             Row(
                               children: [
                                 Icon(
                                   Icons.star,
                                   color: Colors.orangeAccent,
                                 ),
                                 Icon(
                                   Icons.star,
                                   color: Colors.orangeAccent,
                                 ),
                                 Icon(
                                   Icons.star,
                                   color: Colors.orangeAccent,
                                 ),
                                 Icon(
                                   Icons.star,
                                   color: Colors.orangeAccent,
                                 ),
                                 Text(
                                   "4.5",
                                   style: GoogleFonts.openSans(
                                       fontSize: 14, fontWeight: FontWeight.w700),
                                 ),
                               ],
                             )
                           ],
                         ),
                         Expanded(child: Container()),
                         SizedBox(
                           height: 3,
                         ),
                         Row(
                           children: [
                             CircularIconButton(
                                 index: 0,
                                 icon: Icons.call,
                                 bgcolor: Colors.green,
                                 iconColor: Colors.white,
                                 height: 40,
                                 width: 40,
                                 iconsize: 25,
                                 hastext: false,
                                 callback: (index) {}),
                             SizedBox(
                               width: 10,
                             ),
                             CircularIconButton(
                                 index: 0,
                                 icon: Icons.message,
                                 bgcolor: MyAppColor.yellow,
                                 iconColor: Colors.white,
                                 height: 40,
                                 width: 40,
                                 iconsize: 25,
                                 hastext: false,
                                 callback: (index) {}),
                           ],
                         ),
                         SizedBox(
                           width: 20,
                         ),
                       ],
                     ),
                     SizedBox(
                       height: 10,
                     ),

                     Divider(
                       color: MyAppColor.white_light,
                     ),
                   ],
                 )
               ],
             ),
           ),
         )



          ],
        ),
      ),
    );
  }
}



