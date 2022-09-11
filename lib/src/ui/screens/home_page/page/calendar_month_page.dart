import 'package:alex_calendar/src/bloc/calendar_bloc/calendar_bloc.dart';
import 'package:alex_calendar/src/ui/common/widgets/stl/todo_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarMonthPage extends StatelessWidget {
  const CalendarMonthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return BlocBuilder<CalendarBloc, CalendarState>(
      builder: (context, calendarState) {
        return SingleChildScrollView(
          child: Column(
            children: [
              TableCalendar(
                onDaySelected: (date, focusDate) {
                  BlocProvider.of<CalendarBloc>(context).add(CalendarEventChangeDate(dateTime: date));
                },
                calendarStyle: const CalendarStyle(canMarkersOverflow: true),
                currentDay: calendarState.currentDay,
                focusedDay: calendarState.currentDay,
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