import 'package:finixmulti_user/FirebaseServices/providers/services_provider.dart';
import 'package:finixmulti_user/Models/UserModle.dart';
import 'package:finixmulti_user/Models/product.dart';
import 'package:finixmulti_user/allScreens/booking_related_screens/booking_successful_screen.dart';
import 'package:finixmulti_user/utils/global_widgets.dart';
import 'package:finixmulti_user/widgets/services_onboarding/payment_page/basic_details_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../utils/app_colors.dart';
import '../../../widgets/services_onboarding/payment_page/bottom_pyment_button.dart';
import '../../../widgets/services_onboarding/payment_page/payment_summary_widget.dart';
import '../../../widgets/services_onboarding/payment_page/paymet_card.dart';
import '../../main_screen.dart';

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
late ServiceProvider mainserviceProvider;
  Widget build(BuildContext context) {
    return Consumer<ServiceProvider>(builder: (_,serviceProvider,__){
      mainserviceProvider=serviceProvider;
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
    });
  }

  void makePayment() async {

    showAlertDialog(context, "Available Soon !",
        "Hii ${mainserviceProvider.userData.name } , Currently Online Payment Option Is Unavailable , You Can Go With Offline Payment Option.");
    return;
    Product selected=mainserviceProvider.selectedProduct;
    mainserviceProvider.bookingData.paymentOption='online';
    mainserviceProvider.bookingData.paymentMethod='UPI';

    UserModel userModel=mainserviceProvider.userData;

    int final_ammount=selected.disPrice*100;
    var options = {
      'key': 'rzp_test_DDDjy3Dnb4MdpS',
      'amount': final_ammount,
      'name': 'Finixmulti Electrical',
      'description': 'Easy payment',
      'theme': {'color': '#9e0093'},
      'prefill': {
        'contact': '+91${userModel.phone_number}',
        'email': '${userModel.email}'
      },
    };

    try {
      razorpay.open(options);
    } catch (e) {}
  }

  //Handle Payment Responses

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    showAlertDialog(context, "Payment Failed",
        "Code: ${response.code}\nDescription: ${response.message}");
  }

  Future<void> handlePaymentSuccessResponse(PaymentSuccessResponse response) async {
    print('you have book successfuly ${mainserviceProvider.bookingData.toJson()}');
    showProgressBar(context, "Please Wait ....");

    await   mainserviceProvider.firebaseDatabaseDAO.saveBookingDetails(mainserviceProvider.bookingData);
    Navigator.pushNamedAndRemoveUntil(context, BookingSuccessfulScreen.routePath, (route) => route.settings.name==MainScreen.routePath);


  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    showAlertDialog(
        context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message) {

    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
