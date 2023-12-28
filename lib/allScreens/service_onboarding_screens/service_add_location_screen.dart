import 'dart:async';

import 'package:finixmulti_user/allScreens/service_onboarding_screens/service_payment_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../utils/app_colors.dart';
import '../../widgets/global/onboarding_appbar.dart';
import '../../widgets/services/location_add_button.dart';

class ServiceAddLocation extends StatefulWidget {
  const ServiceAddLocation({Key? key}) : super(key: key);

  @override
  State<ServiceAddLocation> createState() => _ServiceAddLocationState();
}

class _ServiceAddLocationState extends State<ServiceAddLocation> {
  int currentSelected = -1;

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng( 18.43655463412377, 73.89477824953909),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff7f7f7),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 50,
          ),
          const OnBoardingAppbar(
            title: 'Add your Location',
            currentPage: 2,
          ),
          SizedBox(
            height: 10,
          ),
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
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white
                  ),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your Current Location",
                        style: TextStyle(fontFamily: "Brand-Bold"),
                      ),

                      Row(
                        children: [

                          Icon(
                            Icons.edit_location,
                            size: 30,
                            color: MyAppColor.primary_color,
                          ),
                          Text(
                            "Pune , Hadapsur,412203",
                            style: TextStyle(fontFamily: "Brand-Bold"),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                ),

                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)

                        ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 10.0,
                          spreadRadius: 0.5,
                          offset: Offset(0.7,0.7)
                        )
                      ]

                    ),
                    padding: EdgeInsets.only(top: 15, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,

                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Text(
                            "Selected Location or add new ",
                            style: TextStyle(fontFamily: "Brand-Bold"),
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Icon(
                                  Icons.edit_location,
                                  size: 30,
                                  color: MyAppColor.primary_color,
                                ),
                                Text(
                                  "Pune , Hadapsur,412203",
                                  style: TextStyle(fontFamily: "Brand-Bold"),
                                ),
                              ],
                            ),
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.close)),
                          ],
                        ),
                        Divider(),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            LocationAddButton(
                              index: 0,
                              title: "Home",
                              icon: Icons.home_filled,
                              bgcolor: currentSelected == 0
                                  ? MyAppColor.primary_color
                                  : MyAppColor.white_light,
                              iconColor: currentSelected == 0
                                  ? MyAppColor.white_light
                                  : MyAppColor.primary_color,
                              callback: (index) {
                                setState(() {
                                  currentSelected = index;
                                });
                              },
                            ),
                            LocationAddButton(
                              index: 1,
                              title: "Work",
                              icon: Icons.home_repair_service,
                              bgcolor: currentSelected == 1
                                  ? MyAppColor.primary_color
                                  : MyAppColor.white_light,
                              iconColor: currentSelected == 1
                                  ? MyAppColor.white_light
                                  : MyAppColor.primary_color,
                              callback: (index) {
                                setState(() {
                                  currentSelected = index;
                                });
                              },
                            ),
                            LocationAddButton(
                              index: 2,
                              title: "Add New",
                              icon: Icons.add_location_sharp,
                              bgcolor: currentSelected == 2
                                  ? MyAppColor.primary_color
                                  : MyAppColor.white_light,
                              iconColor: currentSelected == 2
                                  ? MyAppColor.white_light
                                  : MyAppColor.primary_color,
                              callback: (index) {
                                setState(() {
                                  currentSelected = index;
                                });
                              },
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 15, 10, 5),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ServicePaymentScreen()));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: MyAppColor.primary_color,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                "Next",
                                style: TextStyle(
                                  color: MyAppColor.white_light,
                                  fontFamily: "Brand-Bold",
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
