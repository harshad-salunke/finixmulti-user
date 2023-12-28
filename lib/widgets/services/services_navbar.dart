
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class ServicesNavBar extends StatefulWidget {
  Function(int) callback;
  int current;
  ServicesNavBar({required this.callback,required this.current});

  @override
  State<ServicesNavBar> createState() => _ServicesNavBarState();
}

class _ServicesNavBarState extends State<ServicesNavBar> {
  int current=0;

  @override
  Widget build(BuildContext context) {
    current=widget.current;
    return  Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: MyAppColor.white_light,

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: InkWell(
              onTap: (){
                setState(() {
                  current=0;
                  widget.callback(current);

                });

              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color:current==0? MyAppColor.primary_light:MyAppColor.white_light,

                ),
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                margin: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_cart_outlined,
                      color:current==0? MyAppColor.primary_color:MyAppColor.black_light,

                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Products",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color:current==0? MyAppColor.primary_color:MyAppColor.black_light,
                          fontSize: 16
                      ),

                    )
                  ],
                ),

              ),
            ),
          ),

          Expanded(
            child: InkWell(
              onTap: (){
                setState(() {
                  current=1;
                  widget.callback(current);

                });

              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color:current==1? MyAppColor.primary_light:MyAppColor.white_light,

                ),
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                margin: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.home_repair_service,
                      color:current==1? MyAppColor.primary_color:MyAppColor.black_light,

                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Service",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color:current==1? MyAppColor.primary_color:MyAppColor.black_light,
                          fontSize: 16
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
