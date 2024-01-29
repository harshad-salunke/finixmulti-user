import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Models/product.dart';
import '../../utils/app_colors.dart';
import '../global/my_elevated_button.dart';

class BootomCheckOutButton extends StatefulWidget {
  Function() onPressed;
  String btn_text;
  Product product;
  BootomCheckOutButton({required this.product,required this.btn_text,required this.onPressed});
  @override
  State<BootomCheckOutButton> createState() => _BootomCheckOutButtonState();
}

class _BootomCheckOutButtonState extends State<BootomCheckOutButton> {
  final cofettiController = ConfettiController();
  @override
  void initState() {
    // TODO: implement initState
    cofettiController.play();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    cofettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 10, 10, 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10.0,
            spreadRadius: 0.5,
            offset: Offset(0.7, 0.7),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 55,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${calculateDiscountPercentage(widget.product.price,widget.product.disPrice)} % off",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        fontFamily: 'Brand-Bold',
                        color: Colors.deepOrange,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "₹ ${widget.product.price}",
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                        color: MyAppColor.black_light,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom:0 ,
                  left: 0,
                  child: ConfettiWidget(
                    confettiController: cofettiController,
                    blastDirection: -120,
                    particleDrag: 0.1, // Adjust particle drag to control the size
                    emissionFrequency: 0.05,
                    minimumSize: Size(5,5),//
                    shouldLoop: false,// Adjust
                    maximumSize: Size(10,10),// Adjust emission frequency
                    numberOfParticles: 5, // Adjust the number of particles
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: MyElevatedButton(
              title: "${widget.btn_text}",
              height: 45,
              width: double.infinity,
              fontsize: 18,
              radius: 5,
              bg_color: MyAppColor.primary_color,
              fontWeight: FontWeight.w100,
              onPressed: widget.onPressed,
            ),
          )
        ],
      ),
    );
  }
  int calculateDiscountPercentage(int originalPrice, int discountedPrice) {
    if (originalPrice <= 0 || discountedPrice <= 0) {
      return 0;
    }
    int discountPercentage =
    ((originalPrice - discountedPrice) / originalPrice * 100).round();
    return discountPercentage;
  }
}