import 'package:finixmulti_user/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class BookingCard extends StatelessWidget {
  const BookingCard({Key? key}) : super(key: key);

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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Card(

              child: Image(
                image: AssetImage(
                  "assets/images/newlogo.png"
                ),
                fit: BoxFit.cover,
                height: 100,
                width: 100,
              ),
            ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Fan Service",
                    style: GoogleFonts.openSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text("12 April, 2023, 11:00 PM ",
                    style: GoogleFonts.ubuntu(
                        fontSize: 14,
                        color: MyAppColor.black_light,
                        fontWeight: FontWeight.w400,

                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(Icons.star,
                      color:Colors.orangeAccent ,),
                      Text("4.5",
                        style: GoogleFonts.openSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w700
                        ),),
                    ],
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(Icons.delete_outline,
                  color:Colors.black ,),
                  SizedBox(
                    height: 40,
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),

                  Icon(Icons.circle,color: Colors.indigo,
                  size: 15,),
                  SizedBox(
                    width: 5,
                  ),
                  Text("By Harshad Salunke",
                  style: GoogleFonts.ubuntu(
                    color: MyAppColor.black_light
                  ),)
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: MyAppColor.green_light,

                ),
                padding: EdgeInsets.all(7),
                child: Text("Active",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color:Colors.green,
                      fontSize: 16
                  ),

                ),

              )

            ],
          )
        ],
      ),
    );
  }
}
