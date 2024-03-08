import 'package:finixmulti_user/FirebaseServices/providers/firbase_auth_handler.dart';
import 'package:finixmulti_user/Models/offers_model.dart';
import 'package:finixmulti_user/allScreens/mainSubscreen/booking_screen.dart';
import 'package:finixmulti_user/allScreens/mainSubscreen/home_screen.dart';
import 'package:finixmulti_user/allScreens/mainSubscreen/all_services_screen.dart';
import 'package:finixmulti_user/allScreens/mainSubscreen/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:popup_banner/popup_banner.dart';
import 'package:provider/provider.dart';

import '../FirebaseServices/providers/services_provider.dart';
import '../utils/app_colors.dart';
class MainScreen extends StatefulWidget {
  static final String routePath="/mainscreen";
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> images = [
    "https://tinyurl.com/popup-banner-image",
    "https://tinyurl.com/popup-banner-image2",
    "https://tinyurl.com/popup-banner-image3",
    "https://tinyurl.com/popup-banner-image4"
  ];

   late  PageController pageController;
   FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  int currentPage=0;
  @override
  void initState() {
    pageController=PageController(initialPage: 0);
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) {

      showDefaultPopup();
    });
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

      body: SafeArea(
        child: PageView(
          controller: pageController,
          onPageChanged: (index){
            setState(() {
              currentPage=index;
            });
          },
          children: [
            HomeScreen(
              isBooknowBtnClick:(){
                setState(() {
                  pageController.jumpToPage(1);
                });
              },
                isProfileBtnClick: (){
                  setState(() {
                    pageController.jumpToPage(3);

                  });
                },
            ),
            AllServicesScreen(),
            BookingScreen(
                isBooknowBtnClick:(){
                  setState(() {
                    pageController.jumpToPage(1);

                  });

                }
            ),
            ProfileScreen()
          ],
        ),
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
  void showDefaultPopup() {
    bool isOfferLoading=Provider.of<ServiceProvider>(context,listen: false).isOfferLoading;
    OffersModel offersModel=Provider.of<ServiceProvider>(context,listen: false).offersModelData;
    if(!isOfferLoading){
      if(offersModel.imageEvent.length>0){
        PopupBanner(
          context: context,
          images: offersModel.imageEvent,
          onClick: (index) {
            debugPrint("CLICKED $index");
          },
        ).show();

      }
    }

  }
}
