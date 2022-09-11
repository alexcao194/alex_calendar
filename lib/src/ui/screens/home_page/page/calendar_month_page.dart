// ignore_for_file: depend_on_referenced_packages

import 'package:alex_calendar/src/bloc/calendar_bloc/calendar_bloc.dart';
import 'package:alex_calendar/src/ui/common/widgets/stl/todo_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarMonthPage extends StatelessWidget {
  const CalendarMonthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarBloc, CalendarState>(
      builder: (context, calendarState) {
        return SingleChildScrollView(
          child: Column(
            children: [
              TableCalendar(
                onDaySelected: (date, focusDate) {
                  BlocProvider.of<CalendarBloc>(context).add(CalendarEventChangeDate(currentDate: date, focusDate: focusDate));
                },
                onPageChanged: (focusDate) {
                  BlocProvider.of<CalendarBloc>(context).add(CalendarEventChangeDate(currentDate: calendarState.currentDate, focusDate: focusDate));
                },
                calendarStyle: const CalendarStyle(canMarkersOverflow: true),
                currentDay: calendarState.currentDate,
                focusedDay: calendarState.focusDate,
                firstDay: DateTime.utc(1990, 1, 1),
                lastDay: DateTime.utc(2042, 28, 4),
                headerVisible: false,
              ),
              const TodoCard(),
              const TodoCard(),
              const TodoCard(),
              const TodoCard()
            ],
          ),
        );
      },
    );
  }
}