

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Models/address.dart';
import '../widgets/global/progress_dialog.dart';




SnackBar getMySnackBar(String title,String msg,ContentType contentType){
  final snackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: title,
      message: msg,
      contentType: contentType,
    ),
  );
  return snackBar;
}

void showToast(String discription, ContentType contentType,BuildContext context) async {
  final snackBar = getMySnackBar('Hii , there!', discription, contentType);

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}

void showProgressBar(BuildContext context,String title){
  showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing by tapping outside
      builder: (BuildContext context) {
        return ProgressDialog(text: title,);
      });
}

String formatDateString(String inputDate) {
  try {
    DateTime parsedDate = DateFormat("dd-MM-yyyy").parse(inputDate);

    String formattedDate = DateFormat("dd MMM yyyy").format(parsedDate);

    return formattedDate;
  } catch (e) {
    return inputDate;
  }
}

String getAddressInString(Address address){
  String myAddress='';
  if(address.neighbourhood.isNotEmpty && address.neighbourhood!='' ){
    myAddress+='${address.neighbourhood},';
  }
  if(address.county.isNotEmpty && address.county!='' ){
    myAddress+='${address.county},';
  }
  if(address.stateDistrict.isNotEmpty && address.stateDistrict!='' ){
    myAddress+='${address.stateDistrict},';
  }
  if(address.state.isNotEmpty && address.state!='' ){
    myAddress+='${address.state},';
  }
  if(address.postcode.isNotEmpty && address.postcode!='' ){
    myAddress+='${address.postcode}';
  }
return myAddress;
}

int calculateDiscountPercentage(int originalPrice, int discountedPrice) {
  if (originalPrice <= 0 || discountedPrice <= 0) {
    return 0;
  }
  int discountPercentage =
  ((originalPrice - discountedPrice) / originalPrice * 100).round();
  return discountPercentage;
}