import 'package:cached_network_image/cached_network_image.dart';
import 'package:finixmulti_user/FirebaseServices/providers/services_provider.dart';
import 'package:finixmulti_user/Models/booking_modle.dart';
import 'package:finixmulti_user/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../Models/product.dart';
import '../../utils/global_widgets.dart';
class BookingCard extends StatelessWidget {
  BookingModel bookingModel;
  List<Product> productList;
  List<Product> serviceList;

  BookingCard({required this.bookingModel,required this.productList,required this.serviceList}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 5, 5, 8),
      margin: EdgeInsets.fromLTRB(10, 5, 10, 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: CachedNetworkImage(
                    imageUrl: getImageFromListOfService(context),
                    placeholder: (context, url) => Image.asset(
                      "assets/images/newlogo.png", // Replace with your loading image
                      fit: BoxFit.cover,
                      height: 70,
                      width: 70,
                    ),
                    errorWidget: (context, url, error) =>  Image.asset(
                      "assets/images/newlogo.png", // Replace with your loading image
                      fit: BoxFit.cover,
                      height: 70,
                      width: 70,
                    ),
                    fit: BoxFit.cover,
                    height: 70,
                    width: 70,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(bookingModel.serviceName.length>18?"${bookingModel.serviceName.substring(0,18)} ..":'${bookingModel.serviceName}',
                    style: GoogleFonts.openSans(
                      fontSize: 13,
                      fontWeight: FontWeight.w700
                    ),
                  ),

                  Text("${formatDateString(bookingModel.date)}",
                    style: GoogleFonts.ubuntu(
                        fontSize: 12,
                        color: MyAppColor.black_light,
                        fontWeight: FontWeight.w700

                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [

                      Text("Arrived at ${bookingModel.timeSlot} , ${bookingModel.time}",
                        style: GoogleFonts.ubuntu(
                            fontSize: 11,
                            color: MyAppColor.black_light,
                            fontWeight: FontWeight.w700
                        ),),
                    ],
                  )
                ],
              ),
              Expanded(child: Container()),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [


                  Center(
                    child: Icon(Icons.arrow_forward_ios,size: 20,),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height:2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),

                  Icon(Icons.circle,color: Colors.indigo,
                  size: 15,),
                  SizedBox(
                    width: 5,
                  ),
                  Text( "By Finixmulti Electrical",
                  style: GoogleFonts.ubuntu(
                    color: MyAppColor.black_light,
                    fontSize: 11
                  ),)
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: getBookingBgColor(),

                ),
                padding: EdgeInsets.all(7),
                child: Text(getBookingStatus(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color:getBookingTxtColor(),
                      fontSize: 13
                  ),

                ),

              )

            ],
          )
        ],
      ),
    );
  }


  String getImageFromListOfService(BuildContext context) {
    List<Product> allData=[];
    allData.addAll(productList);
    allData.addAll(serviceList);

    for(int i=0;i<allData.length;i++){
      if(bookingModel.serviceUid==allData[i].uid){
        return allData[i].imgUri[0];
      }}

    return "";
  }

  String getBookingStatus() {
    if(bookingModel.bookingStatus=='pending' || bookingModel.bookingStatus=='active'){
      return 'Active';
    }
    else if(bookingModel.bookingStatus=='completed'){
      return 'Completed';
    }
    return 'Cancelled';
  }

 Color getBookingBgColor() {
   if(bookingModel.bookingStatus=='pending' || bookingModel.bookingStatus=='active' ){
     return MyAppColor.green_light;
   }else if( bookingModel.bookingStatus=='completed'){
     return MyAppColor.yellow;
   }
  return Colors.red;
  }

  Color getBookingTxtColor() {
    if(bookingModel.bookingStatus=='pending' || bookingModel.bookingStatus=='active' ){
      return Colors.green;
    }
    return Colors.white;
  }

}
