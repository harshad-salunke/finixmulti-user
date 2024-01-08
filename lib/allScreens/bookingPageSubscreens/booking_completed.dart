import 'package:flutter/material.dart';

import '../../widgets/booking_page/BookingCard.dart';

class BookingCompleted extends StatefulWidget {
  const BookingCompleted({Key? key}) : super(key: key);

  @override
  State<BookingCompleted> createState() => _BookingCompletedState();
}

class _BookingCompletedState extends State<BookingCompleted> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: (BuildContext con,int index){
            return BookingCard();
          }),
    );
  }
}
