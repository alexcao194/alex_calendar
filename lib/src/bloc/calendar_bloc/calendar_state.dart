part of 'calendar_bloc.dart';

abstract class CalendarState extends Equatable {
  final DateTime currentDay;
  const CalendarState({required this.currentDay});

  @override
  List<Object> get props => [currentDay];
}

class CalendarInitial extends CalendarState {
  const CalendarInitial({required super.currentDay});
}

class CalendarStateDateChanged extends CalendarState {
  const CalendarStateDateChanged({required super.currentDay});
}