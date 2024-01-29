import 'package:finixmulti_user/FirebaseServices/providers/services_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../utils/app_colors.dart';
class TopCurrentLocaton extends StatefulWidget {
  const TopCurrentLocaton({Key? key}) : super(key: key);

  @override
  State<TopCurrentLocaton> createState() => _TopCurrentLocatonState();
}

class _TopCurrentLocatonState extends State<TopCurrentLocaton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ServiceProvider>(builder: (_,serviceProvider,__){
      return Positioned(
        top: 0,
        left: 0,
        right: 0,
        child:Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white
          ),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your Current Location",
                style: TextStyle(fontFamily: "Brand-Bold"),
              ),
              serviceProvider.isAddressLoading?
           Row(
             children: [

              Container(
                height: 23,
                width: 23,
                margin: EdgeInsets.all(3),
                child: CircularProgressIndicator(

                ),
              ),
               SizedBox(
                 width: 3,
               ),
               Text(
                 "Finding your location please wait..",
                 style: TextStyle(fontFamily: "Brand-Bold"),
               ),
             ],
           ): Row(
             crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.edit_location,
                    size: 30,
                    color: MyAppColor.primary_color,
                  ),
                  Expanded(
                    child: Text(
                      "${serviceProvider.myAddressText}",
                      style: TextStyle(fontFamily: "Brand-Bold"),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
