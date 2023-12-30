import 'package:flutter/material.dart';

class BookingActivePage extends StatefulWidget {
  const BookingActivePage({Key? key}) : super(key: key);

  @override
  State<BookingActivePage> createState() => _BookingActivePageState();
}

class _BookingActivePageState extends State<BookingActivePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Active"),
    );
  }
}

