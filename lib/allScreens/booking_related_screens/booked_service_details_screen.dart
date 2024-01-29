import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:finixmulti_user/FirebaseServices/providers/services_provider.dart';
import 'package:finixmulti_user/Models/UserModle.dart';
import 'package:finixmulti_user/Models/booking_modle.dart';
import 'package:finixmulti_user/allScreens/booking_related_screens/vertical_booking_progress_indicator.dart';
import 'package:finixmulti_user/widgets/service_man_widgets/admin_card.dart';
import 'package:finixmulti_user/widgets/service_man_widgets/service_man_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gif/gif.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../Models/product.dart';
import '../../utils/app_colors.dart';
import '../../utils/global_widgets.dart';
import 'package:intl/intl.dart';
import '../../widgets/global/myappbar.dart';
import '../serviceman_details_screen.dart';
class BookedServiceDetails extends StatefulWidget {
  static final routePath="/bookedServiceDetails";

  const BookedServiceDetails({Key? key}) : super(key: key);

  @override
  State<BookedServiceDetails> createState() => _BookedServiceDetailsState();
}

class _BookedServiceDetailsState extends State<BookedServiceDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Consumer<ServiceProvider>(builder:(_,serviceProvider,__){

          return Container(

            child:  SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  MyAppBar(title: "Booking Summary"),
                  getProductCard(serviceProvider),
                  getAddressDetails(serviceProvider),
                  getPriceDetails(serviceProvider),
                  getPaymentDetails(serviceProvider),
                  getServiceManDetails(serviceProvider)
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget getProductCard(ServiceProvider serviceProvider){
    Product product=serviceProvider.selectedProduct;
    BookingModel bookingModel=serviceProvider.bookingData;
    return Container(
      padding:EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.white,
      ),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         SizedBox(height: 3,),
          Text(
              "Booking ID - ${bookingModel.bookedUid}",
            style: TextStyle(
              color: MyAppColor.black_light,
              fontSize: 13
            ),
          ),
          Divider(
            color: MyAppColor.white_light,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: CachedNetworkImage(
                    imageUrl: product.imgUri[0],
                    placeholder: (context, url) => Image.asset(
                      "assets/images/newlogo.png", // Replace with your loading image
                      fit: BoxFit.cover,
                      height: 90,
                      width: 90,
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    fit: BoxFit.cover,
                    height: 90,
                    width: 90,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5,),
                  SizedBox(
                    width: 220,
                    child: Text(
                      getText("${product.name}") ,
                      style: TextStyle(
                        color: Colors.black,
                          fontFamily: 'Brand-Regular',
                          fontSize: 16,fontWeight: FontWeight.w300),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'brand- Cisco',
                    style: GoogleFonts.ubuntu(
                        color: Colors.black,
                        fontSize: 13,fontWeight: FontWeight.w300),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "₹ ${product.disPrice}",
                        style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                      SizedBox(
                        width: 8,
                      ),

                      Text(
                        "₹ ${product.price}",
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: MyAppColor.black_light,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

            ],
          ),
          Divider(
            color: MyAppColor.white_light,
          ),
          bookingModel.bookingStatus=='cancelled' ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color:Color(0xffb30000),
                      borderRadius: BorderRadius.all(Radius.circular(50))
                    ),
                    height: 30,
                    width: 30,
                    child: Center(
                      child:  Gif(
                        image:
                        AssetImage("assets/images/loading.gif"),
                        autostart: Autostart.loop,
                        height: 30,
                      ),
                    ),
                  ),
                  SizedBox(width: 5,),
                  Text(
                    'Finixmulti Electrical',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color:Color(0xffb30000),
                        fontFamily: 'Brand-Bold'),
                  ),
                ],
              ),
              VerticalBookingProgressIndicator(
                  isFirst: false,
                  isLast: false,
                  isPast: true,
                  color:Color(0xffb30000),
                  timelineAxis: TimelineAxis.vertical,

                  text: "Booking Confirmed , ${formatDateString(bookingModel.orderDate)} "),

              VerticalBookingProgressIndicator(
                  timelineAxis: TimelineAxis.vertical,
                  color:Color(0xffb30000),

                  isFirst: false, isLast: true, isPast: true, text: "Booking Cancelled."),
            ],
          ):
         Column(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Row(
               children: [
                 Container(
                   decoration: BoxDecoration(
                       color: MyAppColor.primary_color,
                       borderRadius: BorderRadius.all(Radius.circular(50))
                   ),
                   height: 30,
                   width: 30,
                   child: Center(
                     child:  Gif(
                       image:
                       AssetImage("assets/images/loading.gif"),
                       autostart: Autostart.loop,
                       height: 30,
                     ),
                   ),
                 ),
                 SizedBox(width: 5,),
                 Text(
                   'Finixmulti Electrical',
                   style: TextStyle(
                       fontSize: 14,
                       fontWeight: FontWeight.bold,
                       color: MyAppColor.primary_color,
                       fontFamily: 'Brand-Bold'),
                 ),
               ],
             ),
             VerticalBookingProgressIndicator(
                 isFirst: false,
                 isLast: false,
                 isPast: true,
                 timelineAxis: TimelineAxis.vertical,

                 text: "Booking Confirmed , ${formatDateString(bookingModel.orderDate)} "),

             VerticalBookingProgressIndicator(
                 timelineAxis: TimelineAxis.vertical,

                 isFirst: false, isLast: true, isPast: false, text: "Arrived at ${formatDateString(bookingModel.date)} , ${bookingModel.time}"),
           ],
         ),
          Divider(
            color: MyAppColor.white_light,
          ),
          Row(
            mainAxisAlignment:bookingModel.bookingStatus=='active'? MainAxisAlignment.spaceEvenly:MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Need Help ?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15
                  ),
                ),
              ),

              bookingModel.bookingStatus=='active'?Container(height: 20,width: 1,color: MyAppColor.primary_color,):Container(),
              bookingModel.bookingStatus=='active'? InkWell(
                onTap: (){
                  showCancelDialog(context,serviceProvider);
                },
                child: Center(
                  child: Text(
                    'Cancel',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15
                    ),
                  ),
                ),
              ):Container(),

            ],
          )

        ],
      ),
    );
  }


 Widget getAddressDetails(ServiceProvider serviceProvider) {
    UserModel userModel=serviceProvider.userData;
    BookingModel bookingModel=serviceProvider.bookingData;
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 3,),
          Text(
            "Address Details",
            style: TextStyle(
                color: MyAppColor.primary_color,
                fontSize: 13,

            ),
          ),
          Divider(
            color: MyAppColor.white_light,
          ),
          Text(
              "${userModel.name}",
            style: TextStyle(
              fontSize: 17
            ),
          ),
          SizedBox(height: 5,),
          Text('${getAddressInString(bookingModel.address)}'),
          SizedBox(height: 2,),

          Text('District ${bookingModel.address.stateDistrict}'),
          SizedBox(height: 2,),

          Text('${bookingModel.address.state} - ${bookingModel.address.postcode}'),
          SizedBox(height: 2,),

          Text('Phone number : ${userModel.phone_number}'),



        ],
      ),
    );
 }

  String getText(String str){
    if(str.length>230){
      return '${str.substring(0,230)}...';
    }
    return str;
  }

 Widget getPriceDetails(ServiceProvider serviceProvider) {
    Product product=serviceProvider.selectedProduct;
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 3,),
          Text(
            "Price Details",
            style: TextStyle(
              color: MyAppColor.primary_color,
              fontSize: 13,

            ),
          ),
          Divider(
            color: MyAppColor.white_light,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                "₹ ${product.price}",
                style: GoogleFonts.ubuntu(
                  fontSize: 15,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Coupon or discount",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                "-₹ ${product.price-product.disPrice}",
                style: GoogleFonts.ubuntu(
                  fontSize: 15,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tax and fee",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                "₹ 0.0",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Divider(
            height: 2,
            color: Colors.black,
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Grand Total",
                style: GoogleFonts.openSans(
                    fontSize: 15,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "₹ ${product.disPrice}",
                style: GoogleFonts.ubuntu(
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );

  }

  Widget getPaymentDetails(ServiceProvider serviceProvider) {
    BookingModel bookingModel=serviceProvider.bookingData;
    Product product=serviceProvider.selectedProduct;
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 3,),
          Text(
            "Payment Details",
            style: TextStyle(
              color: MyAppColor.primary_color,
              fontSize: 13,

            ),
          ),
          Divider(
            color: MyAppColor.white_light,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Payment Option",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                "${bookingModel.paymentOption}",
                style: GoogleFonts.ubuntu(
                  fontSize: 15,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Payment Method",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                "${bookingModel.paymentMethod}",
                style: GoogleFonts.ubuntu(
                  fontSize: 15,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Money",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                "₹ ${bookingModel.paidMoney}",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),

          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "PrePaid Money",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                "₹ 0.0",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),

          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Remaining Money",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                "₹ ${bookingModel.paidMoney}",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),


        ],
      ),
    );

  }

  Widget getServiceManDetails(ServiceProvider serviceProvider) {
    UserModel userModel=serviceProvider.userData;
    BookingModel bookingModel=serviceProvider.bookingData;
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 3,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Serviceman Details",
                style: TextStyle(
                  color: MyAppColor.primary_color,
                  fontSize: 13,

                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, ServicemanDetailsScreen.routPaht);
                },
                child: Text("View Details",
                    style: GoogleFonts.roboto(
                      color: MyAppColor.primary_color,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    )),
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
    );
  }

  void showCancelDialog(BuildContext context,ServiceProvider serviceProvider) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('Please Confirm'),
            content: const Text('Are you sure to cancelled ?'),
            actions: [
              TextButton(
                  onPressed: () async{
                    BookingModel bookingModel=serviceProvider.bookingData;
                    bookingModel.bookingStatus='cancelled';
                    showProgressBar(context, 'please wait ...!');
                    await serviceProvider.updateBookingDetails(bookingModel);
                    Navigator.pop(context);
                    Navigator.of(context).pop();
                  },
                  child: const Text('Yes')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('No'))
            ],
          );
        });
  }



}
