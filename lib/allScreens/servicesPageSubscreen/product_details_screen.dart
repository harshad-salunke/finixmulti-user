import 'package:finixmulti_user/allScreens/service_onboarding_screens/services_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../FirebaseServices/providers/services_provider.dart';
import '../../Models/UserModle.dart';
import '../../Models/address.dart';
import '../../Models/booking_modle.dart';
import '../../Models/product.dart';
import '../../utils/app_colors.dart';
import '../../widgets/details_page/bottom_checkout_button.dart';
import '../../widgets/details_page/fast_service_widget.dart';
import '../../widgets/details_page/product_description.dart';
import '../../widgets/details_page/product_images.dart';
import '../../widgets/details_page/top_rounded_container.dart';
import '../../widgets/global/my_elevated_button.dart';
import 'package:intl/intl.dart';


class ProductDetailsScreen extends StatelessWidget {
  static String routePath = "/productDetails";
  bool isCallFromOrderSummraryPage;
   ProductDetailsScreen( {this.isCallFromOrderSummraryPage=false}) ;

  @override
  Widget build(BuildContext context) {

    void moveToNextScreen(Product myproduct,bool isProduct) {
      print("move to nextt screen page");
      UserModel userModle =
          Provider.of<ServiceProvider>(context, listen: false)
              .userData;
      DateTime dateTime=DateTime.now();
      String currentDate = DateFormat('dd-MM-yyyy').format(dateTime);

     BookingModel bookingModel=
     BookingModel(
         userName: userModle.name,
         userUid: userModle.uid,
         isProduct: isProduct,
         firstTimeService: false,
         serviceName: myproduct.name,
         serviceUid: myproduct.uid,
         bookedUid: '',
         bookingStatus:'active',
         servingStatus: '',
         orderDate:currentDate,
         date: '',
         timeSlot: '',
         time: '',
         address: Address(neighbourhood: '', county: '', stateDistrict: '', state: '', postcode: '', country: '', latitude: 0.0, longitude: 0.0),
         instruction:'',
         paymentOption: '',
         paymentMethod: '',
         paidMoney:myproduct.disPrice ,
         prepaidMoney: 0,
         assignEmployeeUid:''
     );
      Provider.of<ServiceProvider>(context,listen: false).setBookingData(bookingModel);

      Provider.of<ServiceProvider>(context,listen: false).setEmptyAddress();
      Navigator.pushNamed(context, ServiceOnBoarding.routePath);

    }
    return Consumer<ServiceProvider>(builder: (_,serviceProvidre,__){
      return Scaffold(

        body: SafeArea(
          child: Container(
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: EdgeInsets.zero,
                          elevation: 0,
                          backgroundColor: Colors.white,
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 20),
                          padding:
                          const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Row(
                            children: [
                              const Text(
                                "4.7",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 4),
                              SvgPicture.asset("assets/icons/Star Icon.svg"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                ProductImages(product:serviceProvidre.selectedProduct),
                TopRoundedContainer(
                  color: Colors.white,
                  child: Column(
                    children: [
                      ProductDescription(
                        product: serviceProvidre.selectedProduct,
                        pressOnSeeMore: () {},
                      ),
                      TopRoundedContainer(
                        color: const Color(0xFFF6F7F9),
                        child: Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: Column(
                            children: [
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

                              OtherBasicDetails(
                                product: serviceProvidre.selectedProduct,
                              ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar:isCallFromOrderSummraryPage?
        Container(
          margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: MyElevatedButton(
            title: "Done",
            height: 45,
            width: double.infinity,
            fontsize: 18,
            radius: 5,
            bg_color: MyAppColor.primary_color,
            fontWeight: FontWeight.w100,
            onPressed:(){
              Navigator.pop(context);
            },
          ),
        ):
        SafeArea(
          child: BootomCheckOutButton(
            product: serviceProvidre.selectedProduct,
            btn_text: 'Order Now',
            onPressed: (){
              moveToNextScreen(serviceProvidre.selectedProduct, true);
            },
          ),
        ),
      );
    });
  }


}



