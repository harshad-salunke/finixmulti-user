import 'package:flutter/material.dart';

import '../BookingCard.dart';
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
            return BookingCard();
          }),
    );
  }
}
