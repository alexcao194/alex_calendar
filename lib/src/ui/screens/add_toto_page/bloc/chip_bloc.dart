import 'dart:async';

import 'package:alex_calendar/src/models/todo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'chip_event.dart';
part 'chip_state.dart';

class ChipBloc extends Bloc<ChipEvent, ChipState> {
  ChipBloc() : super(const ChipInitial(role: Roles.working)) {
    on<ChipEventOnClick>(_onClick);
  }

  FutureOr<void> _onClick(ChipEventOnClick event, Emitter<ChipState> emit) {
    emit(ChipStateClicked(role: event.role));
  }
}
