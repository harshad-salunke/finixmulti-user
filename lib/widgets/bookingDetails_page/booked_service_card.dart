import 'package:cached_network_image/cached_network_image.dart';
import 'package:finixmulti_user/utils/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Models/booking_modle.dart';
import '../../Models/product.dart';
import '../../utils/app_colors.dart';
import '../services_onboarding/orderSummary_page/order_summary_service_card.dart';

class BookedServiceCard extends StatelessWidget {
  BookingModel bookingModle;
  Product product;
  BookedServiceCard({required this.bookingModle,required this.product}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin:EdgeInsets.fromLTRB(10,0,10,5),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: MyAppColor.primary_light,
                  blurRadius: 10.0,
                  spreadRadius: 0.5,
                  offset: Offset(0.7,0.7)
              )]
        ),
        child:   Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
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
                    height: 60,
                    width: 60,
                  ),
                  errorWidget: (context, url, error) =>  Image.asset(
                    "assets/images/newlogo.png", // Replace with your loading image
                    fit: BoxFit.cover,
                    height: 60,
                    width: 60,
                  ),
                  fit: BoxFit.cover,
                  height: 60,
                  width: 60,
                ),
              ),
            ),
            SizedBox(width: 5,),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(getTextName('${product.name}'),
                  style: GoogleFonts.openSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w700
                  ),
                ),

                Text("Pick up date",
                  style: GoogleFonts.openSans(
                      fontSize: 12,
                      fontWeight: FontWeight.w700
                  ),),
                Text("${formatDateString(bookingModle.date)}",
                  style: GoogleFonts.ubuntu(
                    fontSize: 12,
                    color: MyAppColor.black_light,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Expanded(child: Container()),

            Icon(Icons.navigate_next)
          ],
        )
    );
  }

  String getTextName(String name) {

    if(name.length>25){
      return '${ name.substring(0,25)}..';
    }
    return name;

  }
}
