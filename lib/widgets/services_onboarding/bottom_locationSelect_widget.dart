import 'package:finixmulti_user/widgets/global/my_elevated_button.dart';
import 'package:flutter/material.dart';

import '../../allScreens/service_onboarding_screens/service_payment_screen.dart';
import '../../allScreens/service_onboarding_screens/service_order_summary_screen.dart';
import '../../utils/app_colors.dart';
import '../services/location_add_button.dart';
import 'address_bottom_sheet.dart';

class BottomLocationSelect extends StatefulWidget {
  const BottomLocationSelect({Key? key}) : super(key: key);

  @override
  State<BottomLocationSelect> createState() => _BottomLocationSelectState();
}

class _BottomLocationSelectState extends State<BottomLocationSelect> {
  int currentSelected = -1;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40)

            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.black,
                  blurRadius: 10.0,
                  spreadRadius: 0.5,
                  offset: Offset(0.7,0.7)
              )
            ]

        ),
        padding: EdgeInsets.only(top: 15, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            Container(
              margin: EdgeInsets.only(left: 15),
              child: Text(
                "Selected Location or add new ",
                style: TextStyle(fontFamily: "Brand-Bold"),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.edit_location,
                      size: 30,
                      color: MyAppColor.primary_color,
                    ),
                    Text(
                      "Pune , Hadapsur,412203",
                      style: TextStyle(fontFamily: "Brand-Bold"),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.close)),
              ],
            ),
            Divider(),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LocationAddButton(
                  index: 0,
                  title: "Home",
                  icon: Icons.home_filled,
                  bgcolor: currentSelected == 0
                      ? MyAppColor.primary_color
                      : MyAppColor.white_light,
                  iconColor: currentSelected == 0
                      ? MyAppColor.white_light
                      : MyAppColor.primary_color,
                  callback: (index) {
                    setState(() {
                      currentSelected = index;
                    });
                  },
                ),
                LocationAddButton(
                  index: 1,
                  title: "Work",
                  icon: Icons.home_repair_service,
                  bgcolor: currentSelected == 1
                      ? MyAppColor.primary_color
                      : MyAppColor.white_light,
                  iconColor: currentSelected == 1
                      ? MyAppColor.white_light
                      : MyAppColor.primary_color,
                  callback: (index) {
                    setState(() {
                      currentSelected = index;
                    });
                  },
                ),
                LocationAddButton(
                  index: 2,
                  title: "Add New",
                  icon: Icons.add_location_sharp,
                  bgcolor: currentSelected == 2
                      ? MyAppColor.primary_color
                      : MyAppColor.white_light,
                  iconColor: currentSelected == 2
                      ? MyAppColor.white_light
                      : MyAppColor.primary_color,
                  callback: (index) {
                    showBottomSheet(context);
                    setState(() {
                      currentSelected = index;
                    });
                  },
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 15, 10, 5),
              child: MyElevatedButton(
                  title: "Confirm Location",
                  height: 55,
                  width: double.infinity,
                  fontsize: 16,
                  radius: 5,
                  bg_color: MyAppColor.primary_color,
                  fontWeight: FontWeight.w100,
                  onPressed: (){
                    Navigator.pushNamed(context, ServiceOrderSummary.routePath);
                  }),
            )
          ],
        ),
      ),
    );
  }
  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return AddressBottomSheet();
      },
    );
  }


}
