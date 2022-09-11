// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc() : super(CalendarInitial(currentDate: DateTime.now(), focusDate: DateTime.now())) {
    on<CalendarEventChangeDate>(_onChangDate);
    on<CalendarEventChangePage>(_onChangPage);
  }

  FutureOr<void> _onChangDate(CalendarEventChangeDate event, Emitter<CalendarState> emit) {
    emit(CalendarStateDateChanged(focusDate: event.focusDate, currentDate: event.currentDate));
  }

  FutureOr<void> _onChangPage(CalendarEventChangePage event, Emitter<CalendarState> emit) {
    emit(CalendarStatePageChanged(currentDate: event.currentDate, focusDate: event.focusDate));
  }
}
