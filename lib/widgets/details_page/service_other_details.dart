import 'dart:async';

import 'package:finixmulti_user/Models/product.dart';
import 'package:finixmulti_user/widgets/global/my_brand_bold_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';

class ServiceOtherBasicDetails extends StatefulWidget {
  final Product product;

  ServiceOtherBasicDetails({required this.product}) ;

  @override
  State<ServiceOtherBasicDetails> createState() => _ServiceOtherBasicDetailsState();
}

class _ServiceOtherBasicDetailsState extends State<ServiceOtherBasicDetails> {
  int minutes = 1;
  int seconds = 0;
  int maxMinutes = 3;
  int maxSeconds = 30;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Column(
        children: [
          Row(
            children: [

              Container(
                margin: EdgeInsets.only(right: 5),
                child: Row(
                  children: [
                    Icon(Icons.verified_outlined,
                      color:Colors.green ,),
                    Text("verified",
                      style: GoogleFonts.openSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.green
                      ),),
                  ],
                ),
              ),


            ],
          ),
          Text(
            'We make sure excellent services thought our expert workers.',
            style: GoogleFonts.ubuntu(
              color: Colors.black54,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),

          Divider(
            color: Colors.black12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Service Details",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: MyAppColor.primary_color,
                    fontFamily: 'Brand-Bold'),
              ),
              Container(

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

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
                                      "Total",
                                      style: GoogleFonts.openSans(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      "₹ ${widget.product.price}",
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
                                      "Service Discount",
                                      style: GoogleFonts.openSans(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      "-₹ ${widget.product.price-widget.product.disPrice}",
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
                                      "Service Charges",
                                      style: GoogleFonts.openSans(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "₹ ${widget.product.disPrice}",
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
              ),

              SizedBox(
                height: 10,
              ),
            ],
          ),
          Divider(
            color: Colors.black12,
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Image.asset(
                    "assets/images/home_service.png",
                    width: 50,
                    height: 50,
                  ),
                  SizedBox(height: 4,),
                  Text("Faster \nService Provide",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                        fontFamily: 'Brand-Bold',
                        fontWeight: FontWeight.w500
                    ),)
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    "assets/images/newlogo.png",
                    width: 50,
                    height: 50,
                  ),
                  SizedBox(height: 4,),
                  Text("Expert \nWorkers",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                        fontFamily: 'Brand-Bold',
                        fontWeight: FontWeight.w500
                    ),)
                ],
              ),

              Column(
                children: [
                  Image.asset(
                    "assets/images/service_logo2.png",
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(height: 4,),
                  Text("Customer \n service",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                        fontFamily: 'Brand-Bold',
                        fontWeight: FontWeight.w500
                    ),)
                ],
              ),

            ],
          ),
          Divider(
            color: Colors.black12,
          ),
          SizedBox(height: 5,),






        ],
      ),
    );
  }

  void startTimer() {
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (minutes == maxMinutes && seconds == maxSeconds) {
          timer.cancel();
        } else {
          if (seconds == 0) {
            if (minutes > maxMinutes ||
                (minutes == maxMinutes && seconds > maxSeconds)) {
              timer.cancel();
            } else {
              minutes++;
              seconds = 59;
            }
          } else {
            seconds--;
          }
        }
      });
    });
  }
}
