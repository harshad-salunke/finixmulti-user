import 'package:finixmulti_user/allScreens/booking_screen.dart';
import 'package:finixmulti_user/allScreens/home_screen.dart';
import 'package:finixmulti_user/allScreens/all_services_screen.dart';
import 'package:finixmulti_user/allScreens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../utils/app_colors.dart';
import 'all_services_Subscreen/products_screen.dart';
class MainScreen extends StatefulWidget {
  static final String routePath="/mainscreen";
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
   late  PageController pageController;
  int currentPage=0;
  @override
  void initState() {
    // TODO: implement initState
    pageController=PageController(initialPage: 0);
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff7f7f7),

      body: PageView(
        controller: pageController,
        onPageChanged: (index){
          setState(() {
            currentPage=index;
          });
        },
        children: [
          HomeScreen(),
          AllServicesScreen(),
          BookingScreen(),
          ProfileScreen()
        ],
      ),

      bottomNavigationBar: Container(
        color: Colors.white,

        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 20),
          child: GNav(
              gap: 8, // the tab button gap between icon and text
              activeColor: MyAppColor.primary_color, // selected icon and text color
              iconSize: 24, // tab button icon size
              tabBackgroundColor: MyAppColor.primary_light, // selected tab background color
              padding: EdgeInsets.all(10) ,
              selectedIndex: currentPage,
              onTabChange: (index){
                pageController.jumpToPage(index);
              },// navigation bar padding
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.storefront,
                  text: 'Services',
                ),
                GButton(
                  icon: Icons.library_books_outlined,
                  text: 'Booking',
                ),

                GButton(
                  icon: Icons.supervised_user_circle,
                  text: 'Profile',
                )
              ]
          ),
        ),
      ),
    );
  }
}
