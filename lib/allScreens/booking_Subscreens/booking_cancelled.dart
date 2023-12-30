import 'package:flutter/material.dart';
class BookingCancelled extends StatefulWidget {
  const BookingCancelled({Key? key}) : super(key: key);

  @override
  State<BookingCancelled> createState() => _BookingCancelledState();
}

class _BookingCancelledState extends State<BookingCancelled> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "cancelled"
        ),
      ),
    );
  }
}
