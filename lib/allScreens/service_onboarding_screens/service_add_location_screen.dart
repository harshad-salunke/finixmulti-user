import 'dart:async';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:finixmulti_user/FirebaseServices/providers/services_provider.dart';
import 'package:finixmulti_user/allScreens/service_onboarding_screens/service_payment_screen.dart';
import 'package:finixmulti_user/utils/global_widgets.dart';
import 'package:finixmulti_user/widgets/services_onboarding/bottom_locationSelect_widget.dart';
import 'package:finixmulti_user/widgets/services_onboarding/top_currentLocation_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../FirebaseServices/api_request/assistanceMethods.dart';
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
  late GoogleMapController new_controller ;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng( 18.43655463412377, 73.89477824953909),
    zoom: 7.4746,
  );

  void locatePosition() async{
    LocationPermission locationPermission=await Geolocator.requestPermission();
    if(locationPermission==LocationPermission.denied || locationPermission==LocationPermission.deniedForever){
      LocationPermission requestPermission=await Geolocator.requestPermission();
    }else{
      Position position=await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      LatLng latLngPosition=LatLng(position.latitude, position.longitude);
      try{
        CameraPosition cameraPosition=new CameraPosition(target: latLngPosition,zoom:14);
        new_controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      }catch(ex){

      }


      await AssistanceMethods.searchAddressByCordinate(latLngPosition.latitude,latLngPosition.longitude,context);
      // await AssistanceMethods.searchAddressByCordinate(18.43655463412377,73.89477824953909,context);

    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    locatePosition();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff7f7f7),
      body: SafeArea(child: Container(
        child: Consumer<ServiceProvider>(builder:(_,serviceProvider,__){
          print(serviceProvider.bookingData.toJson());
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 10,
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
                          new_controller=controller;
                        },
                      ),
                    ),
                    TopCurrentLocaton(),
                    BottomLocationSelect(
                      locateMeButtonClick:locatePosition,
                    )
                  ],
                ),
              ),
            ],
          );
        }),
      ),)
    );
  }
}
