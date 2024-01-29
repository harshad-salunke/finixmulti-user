
import 'package:finixmulti_user/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  Function(String) selectedDate;
  CalendarWidget({required this.selectedDate});
  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();

}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime _focusedDay = DateTime.now();

  void _onDateSelected(DateTime day,DateTime focus){
    String formattedDate = DateFormat('dd-MM-yyyy').format(day);
    widget.selectedDate(formattedDate);

    setState(() {
      _focusedDay=day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 25, 15, 0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${DateFormat("MMM, yyyy").format(_focusedDay)}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  fontFamily: "Brand-Bold"

                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _focusedDay =
                            DateTime(_focusedDay.year, _focusedDay.month - 1);
                      });
                    },
                    child: Card(
                      child: Icon(
                        Icons.chevron_left,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _focusedDay = DateTime(_focusedDay.year, _focusedDay.month + 1);
                      });
                    },
                    child: Card(
                      child: Icon(
                        Icons.chevron_right,
                        color:Colors.black,
                      ),
                    )
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          TableCalendar(
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(_focusedDay.year),
            lastDay: DateTime.utc(2030),
            headerVisible: false,
              rowHeight: 55,
            onFormatChanged: (result) {
            },
            onDaySelected: _onDateSelected,
            availableGestures: AvailableGestures.all,
            selectedDayPredicate: (day)=>isSameDay(day,_focusedDay),
            daysOfWeekStyle: DaysOfWeekStyle(
              dowTextFormatter: (date, locale) {
                return DateFormat("EEE").format(date).toUpperCase();
              },
              weekendStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                color: MyAppColor.primary_color
              ),
              weekdayStyle: TextStyle(
                fontWeight: FontWeight.bold,
                  color: MyAppColor.primary_color


              ),
            ),
            onPageChanged: (day) {
              _focusedDay = day;
              setState(() {});
            },

            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: MyAppColor.primary_light,
                shape: BoxShape.circle,
              ),

              selectedDecoration:  BoxDecoration(
              color: MyAppColor.primary_color,
              shape: BoxShape.circle,
            ),

            ),
          )
        ],
      ),
    );
  }
}