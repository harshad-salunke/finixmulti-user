import 'dart:async';

import 'package:finixmulti_user/FirebaseServices/api_request/assistanceMethods.dart';
import 'package:finixmulti_user/FirebaseServices/providers/services_provider.dart';
import 'package:finixmulti_user/Models/DirectionDetails.dart';
import 'package:finixmulti_user/Models/booking_modle.dart';
import 'package:finixmulti_user/allScreens/booking_related_screens/booked_service_details_screen.dart';
import 'package:finixmulti_user/widgets/global/myappbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../Models/ImageCropper.dart';
import '../../Models/employee.dart';
import '../../utils/app_colors.dart';
import '../../utils/global_widgets.dart';
import '../../widgets/bookingDetails_page/booked_service_card.dart';
import '../../widgets/bookingDetails_page/bottom_serviceman_widget.dart';
class BookingDetailsScreen extends StatefulWidget {
  static final routePath="/bookingDetailsScreen";
  const BookingDetailsScreen({Key? key}) : super(key: key);

  @override
  State<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {

  List<LatLng> plineCordinates=[];
  Set<Polyline> polylineSet={};
  int minutes = 1;
  int seconds = 0;
  int maxMinutes = 120;
  int maxSeconds = 30;
  @override
  void initState() {
    super.initState();
    Provider.of<ServiceProvider>(context,listen: false).fetchEmployeeDetails();
  }


  late StreamSubscription _employeeLocationSubscription;

  @override
  void dispose() {
    _employeeLocationSubscription.cancel();
    super.dispose();
  }

  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();
  late GoogleMapController myLocatoinCamera;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng( 18.43655463412377, 73.89477824953909),
    zoom: 10.4746,
  );
  ImageCropper imageCropper=ImageCropper();
  Set<Marker> markers={};
  bool isFirstime=true;
  late BitmapDescriptor employeeLiveLocationIcon=BitmapDescriptor.defaultMarker;
  late BitmapDescriptor myDefualtIcon=BitmapDescriptor.defaultMarker;
  late BitmapDescriptor destinationIcon=BitmapDescriptor.defaultMarker;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Consumer<ServiceProvider>(builder:(_,serviceeProvider,__){
          BookingModel bookingModel=serviceeProvider.bookingData;
          if(isFirstime && !serviceeProvider.isEmplooyeeLoading && serviceeProvider.employeeData.uid!='' && bookingModel.assignEmployeeUid!=''){
            getCurrentLocation(serviceeProvider);
          }
          return  Container(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                MyAppBar(title: "Booking Details"),
                GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, BookedServiceDetails.routePath);
                    },
                    child: BookedServiceCard(bookingModle: bookingModel,product: serviceeProvider.selectedProduct,)),

                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        child: GoogleMap(
                          mapType: MapType.hybrid,
                          initialCameraPosition: _kGooglePlex,
                          myLocationEnabled: true,
                          myLocationButtonEnabled: true,
                          markers: markers,
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
                          child:
                          bookingModel.servingStatus==''?
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Service man will arrived at",
                                style: TextStyle(fontFamily: "Brand-Bold"),
                              ),

                              Text(
                                '${formatDateString(bookingModel.date)}, ${bookingModel.timeSlot}, ${bookingModel.time}',
                                style: GoogleFonts.firaSansExtraCondensed(
                                  color: MyAppColor.golden_color,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5,),


                            ],
                          ):
                          Column(
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
          );
        }),
      ),
    );
  }


  void getPolyline() async{
    DirectionDetails? directionObj=await AssistanceMethods.obtainPlaceDireactionDetails();
    print("**************************direction data  ${directionObj?.toJson()}");
    plineCordinates.clear();
    if(directionObj!=null){
      directionObj.coordinates.forEach((cordinate) {
        LatLng latLng=LatLng(cordinate[0], cordinate[1]);

        plineCordinates.add(latLng);
      });
      print("size of list ${plineCordinates.length}");

      polylineSet.clear();
      setState(() {

        Polyline polyline=Polyline(
            polylineId: PolylineId('sample'),
          color:Colors.red,
          jointType: JointType.round,
          points: plineCordinates,
          width: 100,
          startCap: Cap.roundCap,
          endCap: Cap.roundCap,
          geodesic: true,

        );
        polylineSet.add(polyline);
      });
     print("poly line ser ${polylineSet}");
    }
  }

  void getCurrentLocation(ServiceProvider serviceProvider) async{
    Employee currentEmployee=serviceProvider.employeeData;
    BookingModel bookingModel=serviceProvider.bookingData;

    myLocatoinCamera=await _controller.future;


    _employeeLocationSubscription = serviceProvider.firebaseDatabaseDAO
        .databaseReference
        .child('Employees')
        .child(serviceProvider.employeeData.uid)
        .onValue
        .listen((event) {
      if (event.snapshot.value != null) {
        Map values = event.snapshot.value as Map;
        Employee employeeModel = Employee.fromJson(values);
        LatLng employeeLiveLocation = LatLng(employeeModel.latitude!, employeeModel.longitude!);
        LatLng destinationLatlng = LatLng(
          serviceProvider.bookingData.address.latitude,
          serviceProvider.bookingData.address.longitude,
        );
        markers.clear();
        if(isFirstime){
          _loadImageMarker(currentEmployee.profile);
          print('setting marker data ${bookingModel.toJson()}');
          myLocatoinCamera.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(zoom:18.0,
              target: LatLng(currentEmployee.latitude!, currentEmployee.longitude!))));
          isFirstime=false;
        }

        Marker destinationMarker = Marker(
          markerId: MarkerId(serviceProvider.bookingData.userName),
          position: destinationLatlng,
          icon: destinationIcon != null ? destinationIcon : myDefualtIcon,
          infoWindow: InfoWindow(
            title: serviceProvider.bookingData.userName,
            snippet: 'Booking Address',
            onTap: () {
              print('destination');
            },
          ),
        );
        Marker currentMarker = Marker(
          markerId: MarkerId(employeeModel.uid),
          position: employeeLiveLocation,
          icon: employeeLiveLocationIcon != null ? employeeLiveLocationIcon : myDefualtIcon,
          infoWindow: InfoWindow(
            title: employeeModel.name,
            onTap: () {
              print('employee');
            },
          ),
        );
        markers.add(destinationMarker);
        markers.add(currentMarker);
        setState(() {});
      }
    });
  }

  void _loadImageMarker(String imageUrl) async {
    print('first time call '+imageUrl);
    employeeLiveLocationIcon=await imageCropper.resizeAndCircle(imageUrl, 150);
    setState(() {

    });
  }

  void loadDefaultIcons()async{
    myDefualtIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(48, 48)), // Set the desired width and height
      'assets/images/app_logo.png', // Replace with your image asset path
    );

    destinationIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(48, 48)), // Set the desired width and height
      'assets/icons/marker.png', // Replace with your image asset path
    );
    setState(() {

    });
  }



}
