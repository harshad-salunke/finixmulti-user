import 'package:finixmulti_user/utils/app_colors.dart';
import 'package:finixmulti_user/widgets/booking_page/booking_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../FirebaseServices/providers/services_provider.dart';
import '../bookingPageSubscreens/booking_active.dart';
import '../bookingPageSubscreens/booking_all.dart';
import '../bookingPageSubscreens/booking_cancelled.dart';
import '../bookingPageSubscreens/booking_completed.dart';




class BookingScreen extends StatefulWidget {
  Function isBooknowBtnClick;
   BookingScreen({required this.isBooknowBtnClick});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
late  PageController pageController;
int currentpage=0;
  @override
  void initState() {

    pageController=PageController(initialPage: 0);
    super.initState();
  }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          SizedBox(height: 10,),
          Text("Bookings",
          style: GoogleFonts.openSans(
            fontSize: 22,
            fontWeight: FontWeight.bold
          ),),
          BookingNavBar(
          callback: (index){
            pageController.jumpToPage(index);
          },
            current: currentpage,
          ),
          Expanded(
            child: PageView(
              controller:pageController,
              onPageChanged: (index){
                setState(() {
                  currentpage=index;
                });
              },
              children: [
                BookingAll(
                    isBooknowBtnClick:widget.isBooknowBtnClick
                ),
                BookingActivePage(),
                BookingCompleted(),
                BookingCancelled()
              ],
            ),
          )
        ],
      ),

    );
  }
}
