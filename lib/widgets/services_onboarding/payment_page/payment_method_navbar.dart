import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class PaymentMethodNavbar extends StatefulWidget {
  Function(int) callback;
  int current;
  PaymentMethodNavbar({required this.callback,required this.current});

  @override
  State<PaymentMethodNavbar> createState() => _PaymentMethodNavbarState();
}

class _PaymentMethodNavbarState extends State<PaymentMethodNavbar> {
  int current = 0;

  @override
  Widget build(BuildContext context) {
    current = widget.current;
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: MyAppColor.white_light,

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: current == 0 ? MyAppColor.primary_light : MyAppColor
                    .white_light,

              ),
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              margin: EdgeInsets.all(5),
              child: InkWell(
                onTap: () {
                  setState(() {
                    current = 0;
                    widget.callback(current);
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage("assets/images/online3.png"),
                      height: 27,
                      width: 30,
                    ),

                    SizedBox(
                      width: 5,
                    ),
                    Text("Online Payment",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: current == 0
                              ? MyAppColor.primary_color
                              : MyAppColor.black_light,
                          fontSize: 14
                      ),

                    )
                  ],
                ),
              ),

            ),
          ),

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: current == 1 ? MyAppColor.primary_light : MyAppColor
                    .white_light,
              ),
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              margin: EdgeInsets.all(5),
              child: InkWell(

                onTap: () {
                  setState(() {
                    current = 1;
                    widget.callback(current);
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Image(
                      image: AssetImage("assets/images/offline1.png"),
                      height: 25,
                      width: 30,
                    ),
                    SizedBox(
                      width: 9,
                    ),

                    Text("Offline Payment",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: current == 1
                              ? MyAppColor.primary_color
                              : MyAppColor.black_light,
                          fontSize: 14
                      ),

                    )
                  ],
                ),
              ),

            ),
          ),


        ],
      ),
    );
  }
}