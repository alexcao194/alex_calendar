part of 'calendar_bloc.dart';

abstract class CalendarEvent extends Equatable {
  const CalendarEvent();
}

class CalendarEventChangeDate extends CalendarEvent {
  final DateTime dateTime;

  const CalendarEventChangeDate({required this.dateTime});

  @override
  List<Object?> get props => [dateTime];
}
