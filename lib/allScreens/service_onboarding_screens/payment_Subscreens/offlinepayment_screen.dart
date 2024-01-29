import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:finixmulti_user/allScreens/booking_related_screens/booking_successful_screen.dart';
import 'package:finixmulti_user/allScreens/main_screen.dart';
import 'package:finixmulti_user/utils/global_widgets.dart';
import 'package:finixmulti_user/widgets/global/my_elevated_button.dart';
import 'package:finixmulti_user/widgets/services_onboarding/payment_page/select_offline_payment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../FirebaseServices/providers/services_provider.dart';
import '../../../utils/app_colors.dart';
import '../../../widgets/services_onboarding/payment_page/paymet_card.dart';

class OfflinePaymentScreen extends StatefulWidget {
  const OfflinePaymentScreen({Key? key}) : super(key: key);

  @override
  State<OfflinePaymentScreen> createState() => _OfflinePaymentScreenState();
}

class _OfflinePaymentScreenState extends State<OfflinePaymentScreen> {
  String paymentMethod="";
  @override
  Widget build(BuildContext context) {
    return Consumer<ServiceProvider>(builder:(_,serviceProvider,__){
      return Stack(
        children: [
          Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 65),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: MyAppColor.white_light,
                    ),
                    Text(
                      "Select Offline Payment Method",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: MyAppColor.primary_color,
                          fontFamily: 'Brand-Bold'),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SelectOfflinePaymentMethod(
                      selectedMethod: (String method){
                        paymentMethod=method;
                      },
                    )
                  ],
                ),
              )),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                  padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                  child: MyElevatedButton(
                      title: "Procced",
                      height: 50,
                      width: double.infinity,
                      fontsize: 20,
                      radius: 5,
                      bg_color: MyAppColor.primary_color,
                      fontWeight: FontWeight.w100,
                      onPressed: () async {
                        if(paymentMethod.isEmpty){
                          showToast("Please Select One Payment Method ...!", ContentType.failure, context);
                        }else{
                          // print(paymentMethod);
                          serviceProvider.bookingData.paymentOption='offline';
                           serviceProvider.bookingData.paymentMethod=paymentMethod;
                          showProgressBar(context, "Please Wait ...");
                          await   serviceProvider.firebaseDatabaseDAO.saveBookingDetails(serviceProvider.bookingData);
                          Navigator.pushNamedAndRemoveUntil(context, BookingSuccessfulScreen.routePath, (route) => route.settings.name==MainScreen.routePath);



                        }
                      })))
        ],
      );
    });
  }
}
