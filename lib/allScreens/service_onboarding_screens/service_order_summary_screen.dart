import 'package:finixmulti_user/allScreens/service_onboarding_screens/service_payment_screen.dart';
import 'package:finixmulti_user/widgets/booking_page/BookingCard.dart';
import 'package:finixmulti_user/widgets/global/my_textfield.dart';
import 'package:finixmulti_user/widgets/services_onboarding/payment_page/payment_summary_widget.dart';
import 'package:finixmulti_user/widgets/services_onboarding/service_selected_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';
import '../../widgets/global/my_elevated_button.dart';
import '../../widgets/global/onboarding_appbar.dart';
import '../../widgets/services_onboarding/orderSummary_page/order_summary_service_card.dart';
class ServiceOrderSummary extends StatefulWidget {
  static final String routePath="/serviceOrderSummaryScreen";

  const ServiceOrderSummary({Key? key}) : super(key: key);

  @override
  State<ServiceOrderSummary> createState() => _ServiceOrderSummaryState();
}

class _ServiceOrderSummaryState extends State<ServiceOrderSummary> {
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
          OnBoardingAppbar(
            title: 'Order Summary',
            currentPage: 3,),

          SummaryBody(),



        ],
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.fromLTRB(15,0,15,0),
        width: double.infinity,
        child: MyElevatedButton(
            title: "Next",
            height: 55,
            width: double.infinity,
            fontsize: 20,
            radius: 5,
            bg_color: MyAppColor.primary_color,
            fontWeight: FontWeight.w100,
            onPressed: (){
              Navigator.pushNamed(context, ServicePaymentScreen.routePath);
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );

  }

  Widget SummaryBody(){
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [

            ServiceSelectedWidget(
              title: 'Your Selected Service',
            ),

            selectedPickedDate(),

            additionalInstruction(),

            Container(
                margin:EdgeInsets.all(10),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.white,
                ),
                child: PaymentSummaryWidget()
            ),

            selectedAddress(),

            SizedBox(
              height: 70,
            )
          ],
        ),
      ),
    );
  }



  Widget selectedAddress() {

  return  Container(
        margin:EdgeInsets.all(10),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.white,
        ),

        child: Column(
          children: [
            SizedBox(height: 10,),
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
                  SizedBox(width: 8,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Selected Address",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: MyAppColor.primary_color,
                              fontFamily: 'Brand-Bold'),
                        ),
                        SizedBox(height: 3,),
                        Row(
                          children: [
                            Icon(Icons.location_on,color: Colors.red,),
                            SizedBox(width: 8,),
                            Text("Pune , Maharashtra",
                              style: GoogleFonts.openSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700
                              ),),
                          ],
                        )


                      ],
                    ),
                  ),
                  Center(
                    child:TextButton(
                      onPressed: (){

                      },
                      child: Text(
                        "Edit",
                        style: GoogleFonts.ubuntu(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: MyAppColor.primary_color,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        )
    );
  }

}

Widget additionalInstruction() {
  return Container(
      margin:EdgeInsets.all(10),
      padding: EdgeInsets.all(8),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.white,
      ),

      child: Column(
        children: [
          SizedBox(height: 10,),
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
                SizedBox(width: 8,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Add instructions",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: MyAppColor.primary_color,
                            fontFamily: 'Brand-Bold'),
                      ),
                      SizedBox(height: 3,),
                      TextField(
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                          hintText: 'Additional instruction of service (optional)',
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: 14,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Color(0xff9e0093)),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      )

                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      )
  );
}

Widget selectedPickedDate() {
  return  Container(
      margin:EdgeInsets.all(10),
      padding: EdgeInsets.all(8),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.white,
      ),

      child: Column(
        children: [
          SizedBox(height: 10,),
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
                SizedBox(width: 8,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "You Picked Date & Time",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: MyAppColor.primary_color,
                            fontFamily: 'Brand-Bold'),
                      ),
                      SizedBox(height: 3,),
                      Row(
                        children: [
                          Icon(Icons.calendar_month_outlined,color: Colors.green,),
                          SizedBox(width: 8,),
                          Text("12 April , 2023 , 11:00 PM",
                            style: GoogleFonts.openSans(
                                fontSize: 12,
                                fontWeight: FontWeight.w700
                            ),),
                        ],
                      )


                    ],
                  ),
                ),
                Center(
                  child:TextButton(
                    onPressed: (){

                    },
                    child: Text(
                      "Edit",
                      style: GoogleFonts.ubuntu(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: MyAppColor.primary_color,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )
  );

}
