import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import 'orderSummary_page/order_summary_service_card.dart';

class ServiceSelectedWidget extends StatelessWidget {
  String title;
   ServiceSelectedWidget({required this.title}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin:EdgeInsets.fromLTRB(10, 10, 10, 3),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.white,
        ),
        child: Column(
          children: [
            SizedBox(height: 8,),
            Container(
              child: Row(
                children: [
                  Center(
                    child: Container(
                      width: 5,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: MyAppColor.primary_color,

                      ),
                    ),
                  ),
                  SizedBox(width: 8,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: MyAppColor.primary_color,
                              fontFamily: 'Brand-Bold'),
                        ),
                        SizedBox(height: 3,),
                        OrderSummaryServiceCard(),


                      ],
                    ),
                  ),
                  Center(
                    child: Icon(Icons.navigate_next),
                  )
                ],
              ),
            )
          ],
        )
    );
  }
}
