import 'package:finixmulti_user/utils/app_colors.dart';
import 'package:finixmulti_user/widgets/booking_page/booking_nav_bar.dart';
import 'package:finixmulti_user/widgets/booking_page/screens/booking_all.dart';
import 'package:finixmulti_user/widgets/booking_page/screens/booking_cancelled.dart';
import 'package:finixmulti_user/widgets/booking_page/screens/booking_completed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/booking_page/screens/booking_active.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

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
          SizedBox(height: 50,),
          Text("Bookings",
          style: GoogleFonts.openSans(
            fontSize: 25,
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
                BookingAll(),
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
