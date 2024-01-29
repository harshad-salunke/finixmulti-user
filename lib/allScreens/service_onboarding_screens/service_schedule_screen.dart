import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:finixmulti_user/FirebaseServices/providers/services_provider.dart';
import 'package:finixmulti_user/Models/booking_modle.dart';
import 'package:finixmulti_user/allScreens/service_onboarding_screens/service_add_location_screen.dart';
import 'package:finixmulti_user/utils/global_widgets.dart';
import 'package:finixmulti_user/widgets/global/my_elevated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../utils/app_colors.dart';
import '../../widgets/global/picktime_custom_box.dart';
import '../../widgets/global/calender_widget.dart';
import '../../widgets/global/onboarding_appbar.dart';

class ServiceScheduleScreen extends StatefulWidget {
  static  final String routePath="/serviceScheduleScreen";

  const ServiceScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ServiceScheduleScreen> createState() => _ServiceScheduleScreenState();
}

class _ServiceScheduleScreenState extends State<ServiceScheduleScreen> {

  List<String> timeSlot=[
    "Morning",
    "Afternoon",
    "Evening",
    "Night"
  ];

  List<String> morningTime=[
    "8:00 AM",
    "8:30 AM",
    "9:00 AM",
    "9:30 AM",
    "10:00 AM",
    "10:30 AM",
    "11:00 AM",
  ];

  List<String> afternoonTime=[
    "11:30 AM",
    "12:00 PM",
    "12:30 PM",
    "1:00 PM",
    "1:30 PM",
    "2:00 PM",
    "2:30 PM",
    "3:30 PM",
    "4:00 PM",
    "4:30 PM",
  ];

  List<String> eveningTime=[
    "5:00 PM",
    "5:30 PM",
    "6:00 PM",
    "6:30 PM",
    "7:00 PM",

  ];

  List<String> nighttime=[
    "7:30 PM",
    "8:00 PM",
    "8:30 PM",
    "9:00 PM",
    "9:30 PM",
    "10:00 PM",
    "10:30 PM",
    "11:00 PM",
    "11:30 PM",
  ];


List<String> selectTimeArray=[];
String selectedDate=DateFormat('dd-MM-yyyy').format(DateTime.now());
int selectedTimeSlot=-1;
int selectedTime=-1;

  @override
  Widget build(BuildContext context) {

    return SafeArea(child: Container(
      child: Consumer<ServiceProvider>(builder: (_,serviceProvider,__){
        BookingModel bookingModel =serviceProvider.bookingData;
        return Scaffold(
          backgroundColor: Color(0xfff7f7f7),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 10,
                ),
                OnBoardingAppbar(
                  title: 'Select Data & Time',
                  currentPage: 1,),
                CalendarWidget(
                  selectedDate: (date){

                    selectedDate=date;
                    print(date);

                  },
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 0, 10),
                  child: Text(
                    "Pick Time",
                    style: GoogleFonts.openSans(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: MyAppColor.primary_color
                    ),
                  ),
                ),

                Container(
                  height: 60,
                  margin: EdgeInsets.only(left: 15),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: timeSlot.length,
                      itemBuilder: (context,index){
                        return InkWell(
                          onTap: (){
                            setState(() {
                              selectedTimeSlot=index;
                              selectedTime=-1;
                              if(selectTimeArray.isNotEmpty){
                                selectTimeArray.clear();
                              }
                              if(index==0){
                                selectTimeArray.addAll(morningTime);
                              }else if(index==1){
                                selectTimeArray.addAll(afternoonTime);
                              }else if(index==2){
                                selectTimeArray.addAll(eveningTime);
                              }else{
                                selectTimeArray.addAll(nighttime);
                              }
                            });
                          },
                          child: PickTimeCustomBox(
                            isSelected: selectedTimeSlot==index,
                            text: timeSlot[index],
                            height: 20,
                            width: 100,
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 60,
                  margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: selectTimeArray.length,
                      itemBuilder: (context,index){
                        return InkWell(
                          onTap: (){
                            setState(() {
                              selectedTime=index;
                            });
                          },
                          child: PickTimeCustomBox(
                            isSelected: selectedTime==index,
                            text: selectTimeArray[index],
                            height: 30,
                            width: 100,
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 100,
                ),

              ],
            ),
          ),
          floatingActionButton: Container(
            margin: EdgeInsets.fromLTRB(15,0,15,0),
            width: double.infinity,
            child: MyElevatedButton(
                title: "Next",
                height: 55,
                width: double.infinity,
                fontsize: 20,
                radius: 5,
                bg_color: MyAppColor.primary_color,
                fontWeight: FontWeight.w100,
                onPressed: (){


                  if(selectedDate==''){
                    showToast("Please Selecte Date ..!", ContentType.failure, context);
                  }else if(selectedTimeSlot==-1){
                    showToast("Please Pick One TimeSlot ..!", ContentType.failure, context);
                  }else if(selectedTimeSlot==-1 || selectedTime==-1){
                    showToast("Please Selecte Time  ..!", ContentType.failure, context);
                  }else{
                    bookingModel.date=selectedDate;
                    bookingModel.timeSlot=timeSlot[selectedTimeSlot];
                    bookingModel.time=selectTimeArray[selectedTime];
                    serviceProvider.setBookingData(bookingModel);
                    Navigator.pushNamed(context, ServiceAddLocation.routePath);

                  }
                }),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

        );
      }),
    ));
  }

}