import 'package:finixmulti_user/allScreens/booking_successful_screen.dart';
import 'package:finixmulti_user/widgets/services_onboarding/payment_page/basic_details_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../utils/app_colors.dart';
import '../../../widgets/global/my_lable_textfield.dart';
import '../../../widgets/services_onboarding/payment_page/bottom_pyment_button.dart';
import '../../../widgets/services_onboarding/payment_page/payment_summary_widget.dart';
import '../../../widgets/services_onboarding/payment_page/paymet_card.dart';

class OnlinePaymentScreen extends StatefulWidget {
  const OnlinePaymentScreen({Key? key}) : super(key: key);

  @override
  State<OnlinePaymentScreen> createState() => _OnlinePaymentScreenState();
}

class _OnlinePaymentScreenState extends State<OnlinePaymentScreen> {
  late Razorpay razorpay;
  var payment_name = ["Google Pay", "Phone Pay", "Paytm", "VISA", "Mastercard"];

  var payment_icons = [
    'googlepay.png',
    "phone-pay.png",
    "paytm.png",
    "visa.png",
    "mastercard.png"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    razorpay = Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
  }

  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 65),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Divider(
                    color: MyAppColor.white_light,
                  ),
                  BasicDetialsWidget(),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: MyAppColor.white_light,
                  ),
                  PaymentSummaryWidget(),
                  Divider(
                    color: MyAppColor.white_light,
                  ),
                  Text(
                    "Payment Method Support",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: MyAppColor.primary_color,
                        fontFamily: 'Brand-Bold'),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: payment_icons.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 4),
                          child: PaymentCard(
                              name: payment_name[index],
                              img: payment_icons[index]),
                        );
                      }),
                ],
              ),
            )),
        Positioned(bottom: 0, left: 0, right: 0,
            child: BottomPaymentButton(
              onPressed: (){
                makePayment();
              },
            )
        ),
      ],
    );
  }

  void makePayment() async {
    var options = {
      'key': 'rzp_test_DDDjy3Dnb4MdpS',
      'amount': 20000,
      'name': 'Finixmulti Electrical',
      'description': 'Easy payment',
      'theme': {'color': '#9e0093'},
      'prefill': {
        'contact': '+919359978498',
        'email': 'harshadsalunke@gmail.com'
      },
    };

    try {
      razorpay.open(options);
    } catch (e) {}
  }

  //Handle Payment Responses

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    showAlertDialog(context, "Payment Failed",
        "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
   Navigator.pushNamed(context, BookingSuccessfulScreen.routePath);
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    showAlertDialog(
        context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed: () {},
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
