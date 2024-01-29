import 'package:finixmulti_user/FirebaseServices/providers/services_provider.dart';
import 'package:finixmulti_user/utils/app_colors.dart';
import 'package:finixmulti_user/widgets/home_page/populer_product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../allScreens/servicesPageSubscreen/product_details_screen.dart';

class ProductSection extends StatefulWidget {
  Function isBooknowBtnClick;
  ProductSection({required this.isBooknowBtnClick}) ;
  @override
  State<ProductSection> createState() => _ProductSectionState();
}

class _ProductSectionState extends State<ProductSection> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ServiceProvider>(builder:(_,serviceProvider,__){
      return Container(
        margin: EdgeInsets.fromLTRB(15, 5, 15, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Popular Products",
                  style: GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: (){
                  widget.isBooknowBtnClick();
                  },
                  child: Text(
                    'View all',
                    style: GoogleFonts.openSans(fontSize: 13, color: MyAppColor.primary_color),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),

            Container(
              height: 220,
                child:
                serviceProvider.isProductDataLoading? Center(
                  child: CircularProgressIndicator(),
                ):
                ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  itemCount: serviceProvider.product_list.length>4?4:serviceProvider.product_list.length,

                  itemBuilder: (BuildContext con, int index) {
                    return InkWell(
                      onTap: (){
                        serviceProvider.setSelectedProduct(serviceProvider.product_list[index]);
                        Navigator.pushNamed(context, ProductDetailsScreen.routePath);
                      },
                      child: PopulerProductCard(
                        product: serviceProvider.product_list[index],
                        isPopularProduct: true,
                        right: 10,
                      ),
                    );
                  },
                )
            ),


          ],
        ),
      );
    });
  }
}
