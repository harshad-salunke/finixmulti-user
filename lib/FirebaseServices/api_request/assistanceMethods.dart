
import 'dart:convert';

import 'package:finixmulti_user/FirebaseServices/api_request/requestAsistance.dart';
import 'package:finixmulti_user/FirebaseServices/providers/services_provider.dart';
import 'package:finixmulti_user/Models/DirectionDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../Models/address.dart';
import '../../utils/global_widgets.dart';

class AssistanceMethods{

  static Future<void> searchAddressByCordinate(double latitude,double longitude,BuildContext context) async{
     String url="https://geocode.maps.co/reverse?lat=${latitude}&lon=${longitude}&api_key=658c60c377354794969737tyd8dce1b";
     var response=await RequestAsistance.getRequest(url);
     response=response['address'];
     print(response);
     print(response);
     if(response!='failed'){
       Address address=Address.fromJson(response);
       address.latitude=latitude;
       address.longitude=longitude;
       print(address.toJson());
       String myAddress=getAddressInString(address);

       print("my current address is"+myAddress);
       Provider.of<ServiceProvider>(context,listen: false).setAddressData(address,myAddress);
     }
     else{

       String error='Failed To Locate you please add manually ';
       Address address=Address(neighbourhood: "", county: "", stateDistrict: "", state: "", postcode: "", country: "", latitude: 0.0, longitude: 0.0);
       Provider.of<ServiceProvider>(context,listen: false).setAddressData(address,error);

     }
  }


 static Future<DirectionDetails?> obtainPlaceDireactionDetails()async{
   String url= "https://api.geoapify.com/v1/routing?waypoints=18.424129364209982,73.90192177438244|18.457937941023676,73.89245187511973&mode=drive&apiKey=d548c5ed24604be6a9dd0d989631f783";
    var response=await RequestAsistance.getRequest(url);

    response=response['features'][0];
    if(response==null || response==''){
      return null;
    }
    DirectionDetails directionDetails=DirectionDetails.fromJson(response);
    print(directionDetails.toJson());
    return directionDetails;
 }

}