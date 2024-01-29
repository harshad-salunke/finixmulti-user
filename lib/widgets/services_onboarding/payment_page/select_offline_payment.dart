import 'package:finixmulti_user/utils/app_colors.dart';
import 'package:finixmulti_user/widgets/services_onboarding/payment_page/radiobutton_payment_card.dart';
import 'package:flutter/material.dart';
class SelectOfflinePaymentMethod extends StatefulWidget {
  Function(String) selectedMethod;
   SelectOfflinePaymentMethod({required this.selectedMethod});

  @override
  State<SelectOfflinePaymentMethod> createState() => _SelectOfflinePaymentMethodState();
}

class _SelectOfflinePaymentMethodState extends State<SelectOfflinePaymentMethod> {
  var method_name=[
    'Cash Money',
    'Google Pay',
    'Phone pay',
    'Paytm'
  ];

  var image_name=[
    'offline.png',
    'googlepay.png',
    'phone-pay.png',
    'paytm.png'
  ];
  int selected=-1;



  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.zero,
          shrinkWrap: true, // Important: set shrinkWrap to true
          physics: NeverScrollableScrollPhysics(), // Disable scrolling for the inner ListView
          itemCount: image_name.length,
          itemBuilder: (context,index){
        return InkWell(
          onTap: (){
            widget.selectedMethod(method_name[index]);
            setState(() {
              selected=index;
            });
          },
          child: RadioButtonPaymentCard(
            name: method_name[index],
            img: image_name[index],
            color:selected==index?MyAppColor.primary_color:Colors.white12,
          ),
        );
      })
    );
  }
}

