import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceDiscountBanner extends StatelessWidget {
  String img;
  String title;
  String discription;
  Color banner_color;
  Color btn_color;
  String btn_text;
  Function buttonClick;
  ServiceDiscountBanner({required this.img,required this.title,required this.discription,
    required   this.banner_color,required this.btn_color,required this.btn_text,required this.buttonClick});


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: banner_color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$title",
                style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    ),
              ),
              Text(
                "$discription",
                style: GoogleFonts.openSans(
                    color: Colors.white70,
                  fontWeight: FontWeight.w300,
                  fontSize: 13
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                height: 30,
                child: ElevatedButton(
                  onPressed: (){
                    buttonClick();
                  }, child: Text("$btn_text",style:
                GoogleFonts.openSans(
                    color: Colors.white,
                  fontSize: 10

                )
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: btn_color,

                ),),
              )
            ],
          ),
          Gif(
            image: AssetImage("assets/images/$img"),
            height: 155,
            width: 155,
            autostart: Autostart.once,
            fit: BoxFit.contain,
          )
        ],
      ),
    );
  }
}
