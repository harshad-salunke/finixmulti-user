import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/app_colors.dart';
class PaymentSummaryWidget extends StatelessWidget {
  const PaymentSummaryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Payment Summary",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: MyAppColor.primary_color,
                fontFamily: 'Brand-Bold'),
          ),
          Container(
            child: Row(
              children: [
                Center(
                  child: Container(
                    width: 5,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: MyAppColor.primary_color,
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Subtotal",
                            style: GoogleFonts.openSans(
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "₹ 0.0",
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
                            style: GoogleFonts.openSans(
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "₹ 0.0",
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
                            style: GoogleFonts.openSans(
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "₹ 0.0",
                            style: GoogleFonts.ubuntu(
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
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "₹ 0.0",
                            style: GoogleFonts.ubuntu(
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
