// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc() : super(CalendarInitial(currentDay: DateTime.now())) {
    on<CalendarEventChangeDate>(_onChangDate);
  }

  FutureOr<void> _onChangDate(CalendarEventChangeDate event, Emitter<CalendarState> emit) {
    print(event.dateTime);
    emit(CalendarStateDateChanged(currentDay: event.dateTime));
  }
}