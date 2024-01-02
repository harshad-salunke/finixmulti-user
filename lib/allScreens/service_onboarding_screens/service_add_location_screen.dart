import 'dart:async';

import 'package:finixmulti_user/allScreens/service_onboarding_screens/service_payment_screen.dart';
import 'package:finixmulti_user/widgets/services_onboarding/bottom_locationSelect_widget.dart';
import 'package:finixmulti_user/widgets/services_onboarding/top_currentLocation_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../utils/app_colors.dart';
import '../../widgets/global/onboarding_appbar.dart';
import '../../widgets/services_onboarding/location_add_button.dart';

class ServiceAddLocation extends StatefulWidget {
  static final String routePath="/serviceAddAddressScreen";

  const ServiceAddLocation({Key? key}) : super(key: key);

  @override
  State<ServiceAddLocation> createState() => _ServiceAddLocationState();
}

class _ServiceAddLocationState extends State<ServiceAddLocation> {

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
            title: 'Add your Address',
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
                TopCurrentLocaton(),
                BottomLocationSelect()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
