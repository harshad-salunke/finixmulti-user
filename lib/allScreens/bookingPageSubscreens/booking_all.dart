import 'package:finixmulti_user/FirebaseServices/providers/services_provider.dart';
import 'package:finixmulti_user/allScreens/booking_related_screens/booking_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/booking_modle.dart';
import '../../Models/product.dart';
import '../../utils/app_colors.dart';
import '../../widgets/booking_page/BookingCard.dart';
import '../../widgets/global/my_elevated_button.dart';

class BookingAll extends StatefulWidget {
  Function isBooknowBtnClick;
   BookingAll({required this.isBooknowBtnClick}) ;

  @override
  State<BookingAll> createState() => _BookingAllState();
}

class _BookingAllState extends State<BookingAll> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ServiceProvider>(builder:(_,serviceProvider,__){
      return Container(

        child:serviceProvider.isBookingLoading ?
        Center(
          child: CircularProgressIndicator(),
        ): serviceProvider.booking_list.length>0?
        ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: serviceProvider.booking_list.length,
            itemBuilder: (BuildContext con,int index){
              return InkWell(
                  onTap: (){
                    serviceProvider.setBookingData(serviceProvider.booking_list[index]);
                    getProductFromList(serviceProvider.booking_list[index], serviceProvider.product_list,serviceProvider.service_list);
                    Provider.of<ServiceProvider>(context,listen: false).setEmptyEmployee();

                    Navigator.pushNamed(context, BookingDetailsScreen.routePath);
                  },
                  child: BookingCard(
                      bookingModel: serviceProvider.booking_list[index],
                      productList:serviceProvider.product_list,
                    serviceList: serviceProvider.service_list,


                  ));
            }):
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "You have Empty \n   Booking Right Now !",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: MyAppColor.black_light,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Brand-Bold',
                  fontSize: 16
                ),
              ),
              MyElevatedButton(
                  title: "Book Now",
                  height: 35,
                  width: 60,
                  fontsize: 12,
                  radius: 5,
                  bg_color: MyAppColor.primary_color,
                  fontWeight: FontWeight.w100,
                  onPressed: (){
                   widget.isBooknowBtnClick();
                  }),
            ],
          ),
        ),

      );
    });
  }
  void getProductFromList(BookingModel bookingModel,List<Product> productList,List<Product> serviceList,) {
    List<Product> allData=[];
    allData.addAll(productList);
    allData.addAll(serviceList);
    for(int i=0;i<allData.length;i++){
      if(bookingModel.serviceUid==allData[i].uid){
        Provider.of<ServiceProvider>(context,listen: false).setSelectedProduct(allData[i]);
        return;
      }
    }
  }
}
