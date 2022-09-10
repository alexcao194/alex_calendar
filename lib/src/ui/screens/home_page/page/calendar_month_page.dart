import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarMonthPage extends StatelessWidget {
  const CalendarMonthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      calendarStyle: const CalendarStyle(
        canMarkersOverflow: true
      ),

      currentDay: DateTime.now(),
      focusedDay: DateTime.utc(2022, 4, 19),
      firstDay: DateTime.utc(1999, 1, 1),
      lastDay: DateTime.utc(2032, 28, 4),
      headerVisible: true,
    );
  }
}
