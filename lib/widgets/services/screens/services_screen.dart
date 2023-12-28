import 'package:finixmulti_user/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../allScreens/service_onboarding_screens/services_onboarding.dart';
import '../main_service_card.dart';

class ServicesSreen extends StatefulWidget {
  const ServicesSreen({Key? key}) : super(key: key);

  @override
  State<ServicesSreen> createState() => _ServicesSreenState();
}

class _ServicesSreenState extends State<ServicesSreen> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(25, 5, 0, 5),
          child: Text(
            "Category",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
            color: MyAppColor.primary_color,
            fontFamily: 'Brand-Bold'),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
          padding: EdgeInsets.zero,
          height: 55,
          child: TextField(
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xff9e0093)),
              ),
              hintText: "Search service name...",
              prefixIcon: Icon(Icons.search_rounded),
            ),
          ),
        ),
        Expanded(
          child: Container(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.689
                ),
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(
                  horizontal: 13,
                ),
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      print("click");
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ServiceOnBoarding()));
                    },
                    child: MainServiceCard(
                      img: "fan_icon.png",
                      title: "Fan Service",
                      bg_color: Colors.white,
                      icon_color:Colors.black45,
                    ),
                  );
                },
              )),
        )
      ],
    );
  }
}
