import 'package:finixmulti_user/allScreens/main_screen.dart';
import 'package:finixmulti_user/widgets/book_successfullypage/success_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gif/gif.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';
import '../widgets/book_successfullypage/person_contact_card.dart';
class BookingSuccessfulScreen extends StatefulWidget {
  static final String routePath="/bookingScrressScreen";

  const BookingSuccessfulScreen({Key? key}) : super(key: key);

  @override
  State<BookingSuccessfulScreen> createState() => _BookingSuccessfulState();
}

class _BookingSuccessfulState extends State<BookingSuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff7f7f7),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            "Confirmation",
            textAlign: TextAlign.center,
            style:TextStyle(
              color: MyAppColor.primary_color,
              fontFamily: "Brand-Bold",
              fontSize: 23, fontWeight: FontWeight.bold,

            ),
          ),

          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),

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

                  SuccessAnimatoin(),

                  Text(
                    "Booked Successfuly",
                    textAlign: TextAlign.center,
                    style:TextStyle(
                      color: Colors.black,
                      fontFamily: "Bold",
                      fontSize: 28, fontWeight: FontWeight.bold,
            
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  InfoTextWidget(),
                  SizedBox(
                    height: 30,
                  ),
                  Divider(
                    color: MyAppColor.white_light,
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Text(
                    " Contact Us",
                    textAlign: TextAlign.center,
                    style:TextStyle(
                      color: MyAppColor.black_light,
                      fontFamily: "Bold",
                      fontSize: 18, fontWeight: FontWeight.bold,

                    ),
                  ),

                  SizedBox(
                    height: 2,
                  ),

                  Text(
                    "Working Hour : 24/7",
                    textAlign: TextAlign.center,
                    style:TextStyle(
                      color: Colors.black,
                      fontFamily: "Bold",
                      fontSize: 14, fontWeight: FontWeight.bold,

                    ),
                  ),
                  PersonContactCard()




                ],
              ),
            ),
          )

        ],
      ),
      floatingActionButton: Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepOrange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Go to Booking Page",
              style: TextStyle(
                color: MyAppColor.white_light,
                fontFamily: "Brand-Bold",
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );

  }
  Widget InfoTextWidget(){
    return  RichText(
        textAlign: TextAlign.center,

        text: TextSpan(
            children: [
              TextSpan(text:"You service has been " ,
                style:GoogleFonts.ubuntu(
                  color: MyAppColor.black_light,

                  fontSize: 13,
                ),),
              TextSpan(text:"Successfully Booked Service man" ,
                style:GoogleFonts.ubuntu(
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),),

              TextSpan(text:"\n detials share with you within the" ,style:GoogleFonts.ubuntu(
                color: MyAppColor.black_light,
                fontSize: 13,
              ),),
              TextSpan(text:" 5 min." ,style:GoogleFonts.ubuntu(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,

                fontSize: 13,
              ),)
            ]
        ));
  }

}




