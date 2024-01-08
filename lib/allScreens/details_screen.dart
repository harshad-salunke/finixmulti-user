import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Models/product.dart';
import '../utils/app_colors.dart';
import '../widgets/details_page/fast_service_widget.dart';
import '../widgets/details_page/product_description.dart';
import '../widgets/details_page/product_images.dart';
import '../widgets/details_page/top_rounded_container.dart';
import '../widgets/services_onboarding/payment_page/bottom_pyment_button.dart';



class DetailsScreen extends StatelessWidget {
  static String routePath = "/details";
Product product;
   DetailsScreen({required this.product});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
     
      body: SafeArea(
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: EdgeInsets.zero,
                      elevation: 0,
                      backgroundColor: Colors.white,
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        children: [
                          const Text(
                            "4.7",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 4),
                          SvgPicture.asset("assets/icons/Star Icon.svg"),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ProductImages(product: product),
            TopRoundedContainer(
              color: Colors.white,
              child: Column(
                children: [
                  ProductDescription(
                    product: product,
                    pressOnSeeMore: () {},
                  ),
                  TopRoundedContainer(
                    color: const Color(0xFFF6F7F9),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              height: 4,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: MyAppColor.black_light,

                              ),
                            ),
                          ),

                          OtherBasicDetails(),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: BottomPaymentButton(
          onPressed: (){

          },
        ),
      ),
    );
  }
}



