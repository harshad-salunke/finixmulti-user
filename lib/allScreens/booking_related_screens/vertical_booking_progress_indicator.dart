import 'package:finixmulti_user/utils/app_colors.dart';
import 'package:finixmulti_user/widgets/bookingDetails_page/text_card.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class VerticalBookingProgressIndicator extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
   Color color;
  final text;
  TimelineAxis timelineAxis;
  VerticalBookingProgressIndicator(
      {required this.isFirst,
        required this.isLast,
        required this.isPast,
        required this.text,
        required  this.timelineAxis,
        this.color=const Color(0xff9e0093),

      });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:78,
      child: TimelineTile(
        axis:timelineAxis ,
        alignment: TimelineAlign.start,
        isFirst: isFirst,
        isLast:isLast,
        beforeLineStyle: LineStyle(
          color: isPast?color:MyAppColor.primary_light,
          thickness: 5, // Adjust thickness as needed
        ),
        indicatorStyle: IndicatorStyle(
          height: 30,
          width: 30,
          color: isPast?color:MyAppColor.primary_light,
          iconStyle: IconStyle(
              iconData:isPast? Icons.done:Icons.horizontal_rule,

              color: isPast?Colors.white:MyAppColor.primary_light
          ),

        ),
        endChild: TextCard(
          isPast: isPast,
          text: text,
          color: color,
        ),
      ),
    );
  }

}
