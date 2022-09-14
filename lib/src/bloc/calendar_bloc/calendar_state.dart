part of 'calendar_bloc.dart';

abstract class CalendarState extends Equatable {
  final DateTime currentDate;
  final DateTime focusDate;
  const CalendarState({required this.currentDate, required this.focusDate});

  @override
  List<Object> get props => [currentDate, focusDate];
}

class CalendarInitial extends CalendarState {
  const CalendarInitial({required super.currentDate, required super.focusDate});
}

class CalendarStateDateChanged extends CalendarState {
  const CalendarStateDateChanged({required super.currentDate, required super.focusDate});
}

class CalendarStatePageChanged extends CalendarState {
  const CalendarStatePageChanged({required super.currentDate, required super.focusDate});
}

class CalendarStatePickBirthdayDone extends CalendarState {
  const CalendarStatePickBirthdayDone({required super.focusDate, required super.currentDate});
}

class CalendarStateChangedAddTodoDate extends CalendarState {
  const CalendarStateChangedAddTodoDate({required super.focusDate, required super.currentDate});
}