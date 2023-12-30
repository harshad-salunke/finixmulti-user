import 'package:finixmulti_user/allScreens/service_onboarding_screens/service_add_location_screen.dart';
import 'package:finixmulti_user/widgets/global/my_elevated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

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

  List<String> picktime=[
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
List<String> selectTime=[];
int currentPick=-1;
int currentTime=-1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff7f7f7),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 50,
            ),
            OnBoardingAppbar(
              title: 'Select Data & Time',
              currentPage: 1,),
            CalendarWidget(),
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
                 itemCount: picktime.length,
                 itemBuilder: (context,index){
               return InkWell(
                 onTap: (){
                   setState(() {
                     currentPick=index;
                     currentTime=-1;
                     if(selectTime.isNotEmpty){
                       selectTime.clear();
                     }
                     if(index==0){
                      selectTime.addAll(morningTime);
                     }else if(index==1){
                       selectTime.addAll(afternoonTime);
                     }else if(index==2){
                       selectTime.addAll(eveningTime);
                     }else{
                       selectTime.addAll(nighttime);
                     }
                   });
                 },
                 child: PickTimeCustomBox(
                   isSelected: currentPick==index,
                   text: picktime[index],
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
                  itemCount: selectTime.length,
                  itemBuilder: (context,index){
                    return InkWell(
                      onTap: (){
                        setState(() {
                          currentTime=index;
                        });
                      },
                      child: PickTimeCustomBox(
                        isSelected: currentTime==index,
                        text: selectTime[index],
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
              Navigator.pushNamed(context, ServiceAddLocation.routePath);
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }
}