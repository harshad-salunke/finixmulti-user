import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../FirebaseServices/providers/services_provider.dart';
import '../../Models/booking_modle.dart';
import '../../Models/product.dart';
import '../../utils/app_colors.dart';
import '../../widgets/booking_page/BookingCard.dart';
import '../booking_related_screens/booking_details_screen.dart';

class BookingActivePage extends StatefulWidget {
  const BookingActivePage({Key? key}) : super(key: key);

  @override
  State<BookingActivePage> createState() => _BookingActivePageState();
}

class _BookingActivePageState extends State<BookingActivePage> {
  List<BookingModel> active_BookingList=[];
  @override
  Widget build(BuildContext context) {
    return Consumer<ServiceProvider>(builder:(_,serviceProvidr,__){
      active_BookingList.clear();
      serviceProvidr.booking_list.forEach((bookedItem) {
        if(bookedItem.bookingStatus=='active'){
          active_BookingList.add(bookedItem);
        }
      });

      return Container(

        child:serviceProvidr.isBookingLoading ?
        Center(
          child: CircularProgressIndicator(),
        ): active_BookingList.length>0?
        ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: active_BookingList.length,
            itemBuilder: (BuildContext con,int index){
              return InkWell(
                  onTap: (){
                    serviceProvidr.setBookingData(active_BookingList[index]);
                    getProductFromList(serviceProvidr.booking_list[index], serviceProvidr.product_list,serviceProvidr.service_list);
                    Navigator.pushNamed(context, BookingDetailsScreen.routePath);
                  },
                  child: BookingCard(
                      bookingModel: active_BookingList[index],
                      productList:serviceProvidr.product_list,
                    serviceList: serviceProvidr.service_list,

                  ));
            }):
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Empty Active \n Bookings Right Now !",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: MyAppColor.black_light,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Brand-Bold',
                    fontSize: 16
                ),
              ),

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

