import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../Models/product.dart';
import '../../utils/app_colors.dart';
import '../../utils/global_widgets.dart';

class ProductCard extends StatelessWidget {
  Product product;
  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 5, 5, 10),
      margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
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
                          height: 80,
                          width: 80,
                        ),
                        errorWidget: (context, url, error) => Image.asset(
                          "assets/images/newlogo.png", // Replace with your loading image
                          fit: BoxFit.cover,
                          height: 80,
                          width: 80,
                        ),
                        fit: BoxFit.cover,
                        height: 80,

                        width: 80,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: GoogleFonts.openSans(
                            fontSize: 14, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${calculateDiscountPercentage(product.price, product.disPrice)} % off",
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.orangeAccent,
                                  size: 20,
                                ),
                                Text(
                                  '${product.rating}',
                                  style: GoogleFonts.openSans(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '₹ ${product.disPrice}',
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w800,
                                fontSize: 15,
                                color: MyAppColor.black_light),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            '₹ ${product.price}',
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
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
              Center(
                child: Icon(Icons.arrow_forward_ios,size: 20,),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.circle,
                    color: Colors.green,
                    size: 15,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Finixmulti electrical assured",

                    style: GoogleFonts.ubuntu(color: MyAppColor.black_light,fontSize: 11),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(right: 5),
                child: Row(
                  children: [
                    Icon(
                      Icons.verified_outlined,
                      color: Colors.green,
                      size: 20,
                    ),
                    SizedBox(width: 4,),
                    Text(
                      "verified",
                      style: GoogleFonts.openSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Colors.green),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }


}
