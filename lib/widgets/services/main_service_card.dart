import 'package:flutter/material.dart';

class MainServiceCard extends StatelessWidget {
  String img;
  String title;
  Color bg_color;
  Color icon_color;
  MainServiceCard({
    required this.img,
    required this.title,
    required this.bg_color,
    required this.icon_color
  });
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(

        children: [
          Card(
              color:bg_color ,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Image(
                  image: AssetImage("assets/serviceImg/$img"),
                  height: 100,
                  color: icon_color,
                  width: 100,
                ),
              )),
          Text("$title",
            textAlign: TextAlign.center,
            maxLines: 5,
            style: TextStyle(
                fontSize: 13,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: "Brand-Regular"

            ),)
        ],
      ),
    );
  }
}
