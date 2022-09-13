// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:alex_calendar/src/config/config.dart';
import 'package:alex_calendar/src/services/router.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc() : super(CalendarInitial(currentDate: DateTime.now(), focusDate: DateTime.now())) {
    on<CalendarEventChangeDate>(_onChangDate);
    on<CalendarEventChangePage>(_onChangPage);
    on<CalendarEventOnPickBirthday>(_onPickBirthday);
    on<CalendarEventOnPickDate>(_onPickDate);
  }

  FutureOr<void> _onChangDate(CalendarEventChangeDate event, Emitter<CalendarState> emit) {
    emit(CalendarStateDateChanged(focusDate: event.focusDate, currentDate: event.currentDate));
  }

  FutureOr<void> _onChangPage(CalendarEventChangePage event, Emitter<CalendarState> emit) {
    emit(CalendarStatePageChanged(currentDate: event.currentDate, focusDate: event.focusDate));
  }

  FutureOr<void> _onPickBirthday(CalendarEventOnPickBirthday event, Emitter<CalendarState> emit) async {
    await showDatePicker(
        context: AppRouter.navigatorKey.currentContext!,
        initialDate: state.currentDate,
        firstDate: Config.startDate,
        lastDate: Config.endDate
    ).then((value) {
      DateTime pickedDate = DateTime(value!.year, value.month, value.day);
      emit(CalendarStatePickBirthdayDone(currentDate: pickedDate, focusDate: pickedDate));
    });
  }

  FutureOr<void> _onPickDate(CalendarEventOnPickDate event, Emitter<CalendarState> emit) async {
    await showDatePicker(
        context: AppRouter.navigatorKey.currentContext!,
        initialDate: state.currentDate,
        firstDate: Config.startDate,
        lastDate: Config.endDate
    ).then((value) {
      DateTime pickedDate = DateTime(value!.year, value.month, value.day);
      emit(CalendarStateDateChanged(currentDate: pickedDate, focusDate: pickedDate));
    });
  }
}
