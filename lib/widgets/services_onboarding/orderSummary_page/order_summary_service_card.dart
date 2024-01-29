import 'package:cached_network_image/cached_network_image.dart';
import 'package:finixmulti_user/FirebaseServices/providers/services_provider.dart';
import 'package:finixmulti_user/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../Models/product.dart';
class OrderSummaryServiceCard extends StatelessWidget {
  const OrderSummaryServiceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ServiceProvider>(builder: (_,serviceProvider,__){
      Product product=serviceProvider.selectedProduct;
      return Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: MyAppColor.white_light,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: CachedNetworkImage(
                imageUrl: product.imgUri[0],
                placeholder: (context, url) => Image.asset(
                  "assets/images/newlogo.png", // Replace with your loading image
                  fit: BoxFit.cover,
                  height: 80,
                  width: 80,
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.cover,
                height: 80,
                width: 80,
              ),
            ),
            SizedBox(width: 5,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(product.name.length>20?'${product.name.substring(0,20)}...':'${product.name}',
                  style: GoogleFonts.openSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w700
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text("Pick up time",
                  style: GoogleFonts.openSans(
                      fontSize: 12,
                      fontWeight: FontWeight.w700
                  ),),
                Text('${serviceProvider.bookingData.date} , ${serviceProvider.bookingData.time}',
                  style: GoogleFonts.ubuntu(
                    fontSize: 12,
                    color: MyAppColor.black_light,
                    fontWeight: FontWeight.w400,

                  ),
                ),

              ],
            ),
          ],
        ),
      );
    });
  }
}
