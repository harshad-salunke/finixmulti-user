import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
class SuccessAnimatoin extends StatelessWidget {
  const SuccessAnimatoin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: EdgeInsets.only(right: 25),
      child: Gif(
        image: AssetImage("assets/images/success3.gif"),
        height: 200,
        autostart: Autostart.loop,
        fit: BoxFit.contain,
      ),
    )
    ;
  }
}
