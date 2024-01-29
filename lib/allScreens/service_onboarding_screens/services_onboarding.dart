import 'package:finixmulti_user/FirebaseServices/providers/services_provider.dart';
import 'package:finixmulti_user/Models/booking_modle.dart';
import 'package:finixmulti_user/allScreens/service_onboarding_screens/service_schedule_screen.dart';
import 'package:finixmulti_user/utils/app_colors.dart';
import 'package:finixmulti_user/widgets/global/my_elevated_button.dart';
import 'package:finixmulti_user/widgets/global/onboarding_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
class ServiceOnBoarding extends StatefulWidget {
 static final  String routePath="/serviceOnBoardingScreen";

  const ServiceOnBoarding({Key? key}) : super(key: key);

  @override
  State<ServiceOnBoarding> createState() => _ServiceOnBoardingState();
}

class _ServiceOnBoardingState extends State<ServiceOnBoarding> {
  bool isLocationPermisstionGiven=false;
  Future<void> requestLocationPermission() async {
    LocationPermission locationPermission=await Geolocator.requestPermission();
    if(locationPermission==LocationPermission.denied || locationPermission==LocationPermission.deniedForever){
      LocationPermission locationPermission=await Geolocator.requestPermission();
    }else{
      isLocationPermisstionGiven=true;
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    requestLocationPermission();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Color(0xfff7f7f7),

      body: SafeArea(
        child: Container(
          child: Consumer<ServiceProvider>(
              builder: (_,serviceProvider,__){

                BookingModel bookingModel=serviceProvider.bookingData;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    OnBoardingAppbar(
                      title:bookingModel.isProduct?'Purchase product' : 'Book your service',
                      currentPage: 0,),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(25, 5, 0, 5),
                      child: Text(
                        bookingModel.isProduct? "Basic Details":'Product Details',
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
                        bookingModel.isProduct?'Are You First Time Purchasing Product From Finixmulti Electrical ?':
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
                      margin: EdgeInsets.fromLTRB(25, 5, 0, 5),

                      child: MyElevatedButton(
                          title: "Yes",
                          height: 40,
                          width: 150,
                          fontsize: 18,
                          radius: 20,
                          bg_color: MyAppColor.primary_color,
                          fontWeight: FontWeight.w100,
                          onPressed: (){
                            if(isLocationPermisstionGiven){
                              bookingModel.firstTimeService=true;
                              serviceProvider.setBookingData(bookingModel);
                              Navigator.pushNamed(context, ServiceScheduleScreen.routePath);
                            }else{
                              requestLocationPermission();
                            }

                          }),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(25, 5, 0, 5),

                      child: MyElevatedButton(
                          title: "No",
                          height: 40,
                          width: 150,
                          fontsize: 18,
                          radius: 20,
                          bg_color: MyAppColor.primary_color,
                          fontWeight: FontWeight.w100,
                          onPressed: (){
                            if(isLocationPermisstionGiven){
                              bookingModel.firstTimeService=false;
                              serviceProvider.setBookingData(bookingModel);
                              Navigator.pushNamed(context, ServiceScheduleScreen.routePath);
                            }else{
                              requestLocationPermission();
                            }


                          }),
                    ),


                    Expanded(child: Container()),

                  ],
                );
              }
          ),
        ),
      )

    );
  }

}
