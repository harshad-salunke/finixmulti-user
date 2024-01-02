import 'package:finixmulti_user/allScreens/booking_details_screen.dart';
import 'package:flutter/material.dart';

import '../../widgets/booking_page/BookingCard.dart';

class BookingAll extends StatefulWidget {
  const BookingAll({Key? key}) : super(key: key);

  @override
  State<BookingAll> createState() => _BookingAllState();
}

class _BookingAllState extends State<BookingAll> {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: ListView.builder(
        padding: EdgeInsets.zero,
          itemCount: 3,
          itemBuilder: (BuildContext con,int index){
            return InkWell(
              onTap: (){
                Navigator.pushNamed(context, BookingDetailsScreen.routePath);
              },
                child: BookingCard());
          }),
    );
  }
}
