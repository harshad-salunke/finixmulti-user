import 'package:finixmulti_user/utils/app_colors.dart';
import 'package:finixmulti_user/widgets/bookingDetails_page/text_card.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class BookingProgressIndicator extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final text;

  BookingProgressIndicator(
      {required this.isFirst,
      required this.isLast,
      required this.isPast,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:78,
      width:120,
      child: TimelineTile(
        axis: TimelineAxis.horizontal,
        alignment: TimelineAlign.center,
        lineXY: 0.3,
        isFirst: isFirst,
        isLast:isLast,
        beforeLineStyle: LineStyle(
          color: isPast?MyAppColor.primary_color:MyAppColor.primary_light,
          thickness: 5, // Adjust thickness as needed
        ),

        indicatorStyle: IndicatorStyle(
          height: isPast?40:20,
          width: isPast?40:20,
          color: isPast?MyAppColor.primary_color:MyAppColor.primary_light,
          iconStyle: IconStyle(
            iconData:isPast? Icons.done:Icons.horizontal_rule,

            color: isPast?Colors.white:MyAppColor.primary_light
          ),

        ),
        endChild: TextCard(
          isPast: isPast,
          text: text,
        ),
      ),
    );
  }

}
