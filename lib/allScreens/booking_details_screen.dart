import 'dart:async';

import 'package:finixmulti_user/widgets/global/myappbar.dart';
import 'package:finixmulti_user/widgets/services_onboarding/service_selected_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../utils/app_colors.dart';
import '../widgets/bookingDetails_page/booked_service_card.dart';
import '../widgets/bookingDetails_page/bottom_serviceman_widget.dart';
import '../widgets/services_onboarding/bottom_locationSelect_widget.dart';
class BookingDetailsScreen extends StatefulWidget {
  static final routePath="/bookingDetailsScreen";
  const BookingDetailsScreen({Key? key}) : super(key: key);

  @override
  State<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {
  int minutes = 1;
  int seconds = 0;
  int maxMinutes = 120;
  int maxSeconds = 30;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng( 18.43655463412377, 73.89477824953909),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            MyAppBar(title: "Booking Details"),
            BookedServiceCard(title: "Your Booked Service"),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    child: GoogleMap(
                      mapType: MapType.hybrid,
                      initialCameraPosition: _kGooglePlex,
                      myLocationEnabled: true,
                      myLocationButtonEnabled: true,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child:Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.white
                      ),
                      margin: EdgeInsets.fromLTRB(60, 10, 60, 0),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Service man will arrived within",
                            style: TextStyle(fontFamily: "Brand-Bold"),
                          ),
                          Text(
                            '$minutes:${seconds.toString().padLeft(2, '0')} min',
                            style: GoogleFonts.firaSansExtraCondensed(
                              color: MyAppColor.golden_color,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  BottomServiceManWidget()
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
  void startTimer() {
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (minutes == maxMinutes && seconds == maxSeconds) {
          timer.cancel();
        } else {
          if (seconds == 0) {
            if (minutes > maxMinutes || (minutes == maxMinutes && seconds > maxSeconds)) {
              timer.cancel();
            } else {
              minutes++;
              seconds = 59;
            }
          } else {
            seconds--;
          }
        }
      });
    });
  }

}
