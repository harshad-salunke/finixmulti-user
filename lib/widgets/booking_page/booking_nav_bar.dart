
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class BookingNavBar extends StatefulWidget {
  Function(int) callback;
  int current;
   BookingNavBar({required this.callback,required this.current});

  @override
  State<BookingNavBar> createState() => _BookingNavBarState();
}

class _BookingNavBarState extends State<BookingNavBar> {
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
                child: Text("All",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color:current==0? MyAppColor.primary_color:MyAppColor.black_light,
                      fontSize: 14
                  ),

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
                child: Text("Active",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color:current==1? MyAppColor.primary_color:MyAppColor.black_light,
                      fontSize: 14
                  ),

                ),

              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: (){
                setState(() {
                  current=2;
                  widget.callback(current);

                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),

                  color:current==2? MyAppColor.primary_light:MyAppColor.white_light,

                ),
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                margin: EdgeInsets.all(5),
                child:
                Text("Completed",
                    textAlign: TextAlign.center,

                    style: TextStyle(
                        fontWeight: FontWeight.w600,

                        color:current==2? MyAppColor.primary_color:MyAppColor.black_light,

                        fontSize: 14
                    )),
              ),
            ),
          ),
          Expanded(child:   InkWell(
            onTap: (){
              setState(() {
                current=3;
                widget.callback(current);

              });
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),

                color:current==3? MyAppColor.primary_light:MyAppColor.white_light,

              ),
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              margin: EdgeInsets.all(5),
              child:
              Text("Cancelled",
                  textAlign: TextAlign.center,

                  style: TextStyle(
                      color:current==3? MyAppColor.primary_color:MyAppColor.black_light,

                      fontWeight: FontWeight.w600,
                      fontSize: 14
                  )),
            ),
          )
          )

        ],
      ),
    );

  }
}
