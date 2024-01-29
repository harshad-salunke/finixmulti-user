import 'package:finixmulti_user/allScreens/service_onboarding_screens/payment_Subscreens/offlinepayment_screen.dart';
import 'package:finixmulti_user/allScreens/service_onboarding_screens/payment_Subscreens/onlinepayment_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../widgets/global/onboarding_appbar.dart';
import '../../widgets/services_onboarding/payment_page/payment_method_navbar.dart';
class ServicePaymentScreen extends StatefulWidget {
  static  final String routePath="/servicePaymentScreen";

  const ServicePaymentScreen({Key? key}) : super(key: key);

  @override
  State<ServicePaymentScreen> createState() => _ServicePaymentScreenState();
}

class _ServicePaymentScreenState extends State<ServicePaymentScreen> {
  late  PageController pageController;
  int currentpage=0;
  @override
  void initState() {
    pageController=PageController(initialPage: 0);
    super.initState();
  }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Container(
        
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
          ),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              OnBoardingAppbar(
                title: 'Payment Method',
                currentPage: 4,),
               SizedBox(
                 height: 10,
               ),
               Expanded(
                 child: Container(
                 decoration: BoxDecoration(
                 color: Colors.white,
        
                 borderRadius: BorderRadius.only(topRight: Radius.circular(40),topLeft: Radius.circular(40))
        ),
        
                   child: Column(
        
                     children: [
                       SizedBox(
                         height: 10,
                       ),
                       Center(
                         child: Container(
                           height: 3,
                           width: 50,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(20),
                             color: MyAppColor.black_light,
        
                           ),
                         ),
                       ),
                       SizedBox(height: 5,),
                       PaymentMethodNavbar(
                         callback: (index){
                           pageController.jumpToPage(index);
                         },
                         current: currentpage,
                       ),
                       Expanded(
                         child: PageView(
                           controller:pageController,
                           onPageChanged: (index){
                             setState(() {
                               currentpage=index;
                             });
                           },
                           children: [
                             OnlinePaymentScreen(

                             ),
                             OfflinePaymentScreen(),
                           ],
                         ),
                       ),
                     ],
                   ),
                 ),
               )
        
        
        
        
            ],
          ),
        ),
      ),
    );
  }
}
