import 'package:finixmulti_user/Models/booking_modle.dart';
import 'package:finixmulti_user/allScreens/serviceman_details_screen.dart';
import 'package:finixmulti_user/utils/app_colors.dart';
import 'package:finixmulti_user/widgets/services_onboarding/location_add_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../FirebaseServices/providers/services_provider.dart';
import '../service_man_widgets/admin_card.dart';
import '../service_man_widgets/service_man_card.dart';
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
    return Consumer<ServiceProvider>(builder:(_,serviceProvider,__){
      BookingModel bookingModel=serviceProvider.bookingData;
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
                      bookingModel.bookingStatus=='cancelled'?
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BookingProgressIndicator(
                              isFirst: true,
                              isLast: false,
                              isPast: true,
                              color:Color(0xffb30000),

                              timelineAxis: TimelineAxis.horizontal,
                              text: "Confirmed"),
                          BookingProgressIndicator(
                              isFirst: false,
                              isLast: true,
                              isPast: true,
                              color:Color(0xffb30000),

                              timelineAxis: TimelineAxis.horizontal,

                              text: "Cancelled"),

                        ],
                      ):Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BookingProgressIndicator(
                              isFirst: true,
                              isLast: false,
                              isPast: true,
                              timelineAxis: TimelineAxis.horizontal,
                              text: "Confirmed"),
                          BookingProgressIndicator(
                              isFirst: false,
                              isLast: false,
                              isPast: true,
                              timelineAxis: TimelineAxis.horizontal,

                              text: "Almost ready"),
                          BookingProgressIndicator(
                              isFirst: false,
                              timelineAxis: TimelineAxis.horizontal,

                              isLast: true, isPast: false, text: "Completed"),
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
                      serviceProvider.isEmplooyeeLoading?
                          Center(
                            child: CircularProgressIndicator(),
                          ):
                      bookingModel.assignEmployeeUid==''? AdminCard():ServiceManCard()
                    ],
                  ),
                ),
              )



            ],
          ),
        ),
      );
    });
  }
}



