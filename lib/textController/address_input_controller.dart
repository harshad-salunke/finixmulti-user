import 'package:finixmulti_user/Models/address.dart';
import 'package:flutter/cupertino.dart';

class AddressInputController {
  TextEditingController house_Controller = TextEditingController();
  TextEditingController landmark_Controller = TextEditingController();
  TextEditingController pincode_Controller = TextEditingController();
  TextEditingController city_Controller = TextEditingController();
  TextEditingController state_Controller = TextEditingController();
  String isValid() {
    if (house_Controller.text.isEmpty) {
      return 'Please Add Flat,House no,Building,Company ....!';
    }
    if (landmark_Controller.text.isEmpty) {
      return 'Please Add Your Landmark ....!';
    }
    if (pincode_Controller.text.isEmpty) {
      return 'Please Add Your PinCode ....!';
    }
    if (city_Controller.text.isEmpty) {
      return 'Please Add Your City Name ....!';
    }
    if (state_Controller.text.isEmpty) {
      return 'Please Add Your Sate Name ....!';
    }
    return 'true';
  }

  Address getData() {
    return Address(
        neighbourhood:'${ house_Controller.text} , ${landmark_Controller.text}',
        county: "India",
        stateDistrict: city_Controller.text,
        state: state_Controller.text,
        postcode: pincode_Controller.text,
        country: "India",
        latitude: 0.0,
        longitude: 0.0);
  }
}
