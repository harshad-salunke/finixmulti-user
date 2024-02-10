import 'dart:async';

import 'package:finixmulti_user/Models/product.dart';
import 'package:finixmulti_user/widgets/global/my_brand_bold_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';

class OtherBasicDetails extends StatefulWidget {
 final Product product;

  OtherBasicDetails({required this.product}) ;

  @override
  State<OtherBasicDetails> createState() => _OtherBasicDetailsState();
}

class _OtherBasicDetailsState extends State<OtherBasicDetails> {
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),

                  Icon(Icons.circle,color: Colors.green,
                    size: 15,),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Finixmulti electrical assured",
                    style: GoogleFonts.ubuntu(
                        color: MyAppColor.black_light
                    ),)
                ],
              ),
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
          Divider(
            color: Colors.black12,
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  SvgPicture.asset(
                      "assets/icons/home_icon.svg",
                    width: 40,
                    height: 40,
                    color: Colors.blue,
                  ),
                  SizedBox(height: 4,),
                  Text("Faster \nService Provide",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                        fontSize: 12,
                      fontWeight: FontWeight.w500
                    ),)
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    "assets/images/online3.png",
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(height: 4,),
                  Text("Online \n Payment Support",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500
                    ),)
                ],
              ),

              Column(
                children: [
                  Image.asset(
                    "assets/images/offline1.png",
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(height: 4,),
                  Text("Offline \n Payment Support",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500
                    ),)
                ],
              ),

            ],
          ),
          SizedBox(height: 5,),

          Divider(
            color: Colors.black12,
          ),

          Row(
            children: [
              Image.asset('assets/icons/fast_service1.png',
              height: 60,
                width: 60,
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "Faster Service",
                    style: GoogleFonts.openSans(
                      color: Colors.green,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  Row(
                    children: [
                      Text(
                        "If ordered within ",
                        style: GoogleFonts.openSans(
                          color: MyAppColor.black_light,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '$minutes:${seconds.toString().padLeft(2, '0')} min',
                        style: GoogleFonts.firaSansExtraCondensed(
                          color: Colors.red,
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          Divider(
            color: Colors.black12,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Product Details",
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
                                "Brand",
                                style: GoogleFonts.openSans(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "${widget.product.brandName}",
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
                                "Warranty Summary",
                                style: GoogleFonts.openSans(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "1 year Manufacture",
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
                                "Not Covered Warranty",
                                style: GoogleFonts.openSans(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "Physical damage",
                                style: GoogleFonts.ubuntu(
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
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 10,
              ),
            ],
          )
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
