part of 'calendar_bloc.dart';

abstract class CalendarEvent extends Equatable {
  const CalendarEvent();
}

class CalendarEventChangeDate extends CalendarEvent {
  final DateTime currentDate;
  final DateTime focusDate;
  const CalendarEventChangeDate({required this.currentDate, required this.focusDate});

  @override
  List<Object?> get props => [currentDate, focusDate];
}

class CalendarEventChangePage extends CalendarEvent {
  final DateTime focusDate;
  final DateTime currentDate;
  const CalendarEventChangePage({required this.focusDate, required this.currentDate});

  @override
  List<Object?> get props => [focusDate, currentDate];
}

class CalendarEventOnPickBirthday extends CalendarEvent {
  final DateTime currentTime;
  const CalendarEventOnPickBirthday({required this.currentTime});

  @override
  List<Object> get props => [currentTime];
}

class CalendarEventOnPickDate extends CalendarEvent {
  final DateTime currentTime;
  const CalendarEventOnPickDate({required this.currentTime});

  @override
  List<Object> get props => [currentTime];
}

class CalendarEventOnChangeAddTodoDate extends CalendarEvent {
  final DateTime currentTime;
  const CalendarEventOnChangeAddTodoDate({required this.currentTime});

  @override
  List<Object> get props => [currentTime];
}

class CalendarEventOnPickTimeAddTodoPage extends CalendarEvent {
  final DateTime currentTime;
  const CalendarEventOnPickTimeAddTodoPage({required this.currentTime});

  @override
  List<Object> get props => [currentTime];
}