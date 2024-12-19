

import 'package:finixmulti_user/allScreens/booking_related_screens/booked_service_details_screen.dart';
import 'package:finixmulti_user/allScreens/booking_related_screens/booking_details_screen.dart';
import 'package:finixmulti_user/allScreens/booking_related_screens/booking_successful_screen.dart';
import 'package:finixmulti_user/allScreens/login_screens/guestLogin.dart';
import 'package:finixmulti_user/allScreens/profile_related_screens/notification_screen.dart';
import 'package:finixmulti_user/allScreens/search_screen.dart';
import 'package:finixmulti_user/allScreens/servicesPageSubscreen/product_details_screen.dart';
import 'package:finixmulti_user/allScreens/main_screen.dart';
import 'package:finixmulti_user/allScreens/service_onboarding_screens/service_add_location_screen.dart';
import 'package:finixmulti_user/allScreens/service_onboarding_screens/service_order_summary_screen.dart';
import 'package:finixmulti_user/allScreens/service_onboarding_screens/service_payment_screen.dart';
import 'package:finixmulti_user/allScreens/service_onboarding_screens/service_schedule_screen.dart';
import 'package:finixmulti_user/allScreens/service_onboarding_screens/services_onboarding.dart';
import 'package:finixmulti_user/allScreens/serviceman_details_screen.dart';
import 'package:finixmulti_user/allScreens/splash_screen.dart';
import 'package:flutter/cupertino.dart';

import '../allScreens/login_screens/login_screen.dart';
import '../allScreens/login_screens/register_screen.dart';
import '../allScreens/servicesPageSubscreen/service_details_screen.dart';

Map<String, Widget Function(BuildContext)> getAppRoutes(){
  Map<String, Widget Function(BuildContext)> appRoutes={};
  appRoutes.addAll(serviceOnBoardingRoutes);
  appRoutes.addAll(globalAppRoutes);
  appRoutes.addAll(bookingsAllRoutes);
  appRoutes.addAll(loginRoutes);
  return appRoutes;
}


Map<String, Widget Function(BuildContext)>serviceOnBoardingRoutes={
  ServiceOnBoarding.routePath:(context)=>const ServiceOnBoarding(),
  ServiceScheduleScreen.routePath:(context)=>const ServiceScheduleScreen(),
  ServiceAddLocation.routePath:(context)=>const ServiceAddLocation(),
  ServiceOrderSummary.routePath:(context)=>const ServiceOrderSummary(),
  ServicePaymentScreen.routePath:(context)=>const ServicePaymentScreen(),
};

Map<String, Widget Function(BuildContext)>loginRoutes={
  LoginScreen.routePath:(context)=>LoginScreen(),
  RegisterScreen.routePath:(context)=>RegisterScreen(),
  GuestLoginScreen.routePath:(context)=>GuestLoginScreen(),
};

Map<String, Widget Function(BuildContext)>bookingsAllRoutes={
  BookingDetailsScreen.routePath:(context)=>BookingDetailsScreen(),
  BookingSuccessfulScreen.routePath:(context)=>const BookingSuccessfulScreen(),
  ServicemanDetailsScreen.routPaht:(conntext)=>ServicemanDetailsScreen(),
  BookedServiceDetails.routePath:(context)=>BookedServiceDetails(),

};

Map<String, Widget Function(BuildContext)>globalAppRoutes={
  MainScreen.routePath:(context)=>const MainScreen(),
  SplashScreen.routePath:(context)=>const SplashScreen(),
  ProductDetailsScreen.routePath:(context)=> ProductDetailsScreen(),
  ServiceDetailsScreen.routePath:(context)=> ServiceDetailsScreen(),
  SearchScreen.routePath:(context)=>SearchScreen(),
  NotificationScreen.routePath:(context)=>NotificationScreen()
};



