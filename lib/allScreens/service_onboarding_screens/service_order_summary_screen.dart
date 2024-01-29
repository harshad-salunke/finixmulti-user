import 'package:finixmulti_user/FirebaseServices/providers/services_provider.dart';
import 'package:finixmulti_user/allScreens/service_onboarding_screens/service_payment_screen.dart';
import 'package:finixmulti_user/allScreens/service_onboarding_screens/service_schedule_screen.dart';
import 'package:finixmulti_user/widgets/services_onboarding/payment_page/payment_summary_widget.dart';
import 'package:finixmulti_user/widgets/services_onboarding/service_selected_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../utils/app_colors.dart';
import '../../widgets/global/my_elevated_button.dart';
import '../../widgets/global/onboarding_appbar.dart';
import '../../widgets/services_onboarding/address_bottom_sheet.dart';
class ServiceOrderSummary extends StatefulWidget {
  static final String routePath="/serviceOrderSummaryScreen";

  const ServiceOrderSummary({Key? key}) : super(key: key);

  @override
  State<ServiceOrderSummary> createState() => _ServiceOrderSummaryState();
}

class _ServiceOrderSummaryState extends State<ServiceOrderSummary> {
  DateTime selectedDateTime = DateTime.now();
  TextEditingController additinal_instractionController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Consumer<ServiceProvider> (builder:(_,serviceProvider,__){
      print(serviceProvider.bookingData.toJson());
      return Scaffold(
        backgroundColor: Color(0xfff7f7f7),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 10,
              ),
              OnBoardingAppbar(
                title: serviceProvider.bookingData.isProduct?'Product Summary':'Service Summary',
                currentPage: 3,),
              SummaryBody(serviceProvider),

            ],
          ),
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
                serviceProvider.bookingData.instruction=additinal_instractionController.text;
                Navigator.pushNamed(context, ServicePaymentScreen.routePath);
              }),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      );
    });



  }

  Widget SummaryBody(ServiceProvider serviceProvider){

    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ServiceSelectedWidget(
              isProduct: serviceProvider.bookingData.isProduct,
              title:serviceProvider.bookingData.isProduct?'Your Selected Product' :'Your Selected Service',

            ),

            selectedPickedDate(
              serviceProvider
            ),

            additionalInstruction(
            ),

            Container(
                margin:EdgeInsets.all(10),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.white,
                ),
                child: PaymentSummaryWidget()
            ),

            selectedAddress(
              serviceProvider
            ),

            SizedBox(
              height: 70,
            )
          ],
        ),
      ),
    );
  }

  Widget selectedAddress(ServiceProvider serviceProvider) {

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
                            Expanded(
                              child: Text('${serviceProvider.myAddressText}',
                                style: GoogleFonts.openSans(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700
                                ),),
                            ),
                          ],
                        )


                      ],
                    ),
                  ),
                  Center(
                    child:TextButton(
                      onPressed: (){

                        showBottomSheet(context);
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
                          controller: additinal_instractionController,
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

  Widget selectedPickedDate(ServiceProvider serviceProvider) {
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
                            Text('${serviceProvider.bookingData.date}, ${serviceProvider.bookingData.time}',
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
                        Navigator.popUntil(context, ModalRoute.withName(ServiceScheduleScreen.routePath));
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

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return AddressBottomSheet();
      },
    );
  }
}



