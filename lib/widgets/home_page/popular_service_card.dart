import 'package:flutter/material.dart';
class ServiceCard extends StatelessWidget {
  String img;
  String title;
  Color bg_color;
  Color icon_color;
  ServiceCard({
    required this.img,
    required this.title,
    required this.bg_color,
    required this.icon_color
});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color:bg_color ,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Image(
                image: AssetImage("assets/serviceImg/$img"),
                height: 70,
                color: icon_color,
                width: 70,
              ),
            )),
        Text("$title",
        style: TextStyle(
          fontSize: 10
        ),)
      ],
    );
  }
}
