
import 'package:finixmulti_user/allScreens/booking_details_screen.dart';
import 'package:finixmulti_user/allScreens/booking_successful_screen.dart';
import 'package:finixmulti_user/allScreens/main_screen.dart';
import 'package:finixmulti_user/allScreens/service_onboarding_screens/service_add_location_screen.dart';
import 'package:finixmulti_user/allScreens/service_onboarding_screens/service_order_summary_screen.dart';
import 'package:finixmulti_user/allScreens/service_onboarding_screens/service_payment_screen.dart';
import 'package:finixmulti_user/allScreens/service_onboarding_screens/service_schedule_screen.dart';
import 'package:finixmulti_user/allScreens/service_onboarding_screens/services_onboarding.dart';
import 'package:finixmulti_user/allScreens/serviceman_details_screen.dart';
import 'package:finixmulti_user/allScreens/splash_screen.dart';
import 'package:flutter/cupertino.dart';

Map<String, Widget Function(BuildContext)> getAppRoutes(){
  Map<String, Widget Function(BuildContext)> appRoutes={};
  appRoutes.addAll(serviceOnBoardingRoutes);
  appRoutes.addAll(globalAppRoutes);
  appRoutes.addAll(bookingsAllRoutes);
  return appRoutes;
}


Map<String, Widget Function(BuildContext)>serviceOnBoardingRoutes={
  ServiceOnBoarding.routePath:(context)=>const ServiceOnBoarding(),
  ServiceScheduleScreen.routePath:(context)=>const ServiceScheduleScreen(),
  ServiceAddLocation.routePath:(context)=>const ServiceAddLocation(),
  ServiceOrderSummary.routePath:(context)=>const ServiceOrderSummary(),
  ServicePaymentScreen.routePath:(context)=>const ServicePaymentScreen(),
};

Map<String, Widget Function(BuildContext)>bookingsAllRoutes={
  BookingDetailsScreen.routePath:(context)=>BookingDetailsScreen(),
  BookingSuccessfulScreen.routePath:(context)=>const BookingSuccessfulScreen(),
  ServicemanDetailsScreen.routPaht:(conntext)=>ServicemanDetailsScreen()
};

Map<String, Widget Function(BuildContext)>globalAppRoutes={
  MainScreen.routePath:(context)=>const MainScreen(),
  SplashScreen.routePath:(context)=>const SplashScreen(),
};



