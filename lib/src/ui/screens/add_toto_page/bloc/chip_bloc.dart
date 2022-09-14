import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'chip_event.dart';
part 'chip_state.dart';

class ChipBloc extends Bloc<ChipEvent, ChipState> {
  ChipBloc() : super(const ChipInitial(id: -1)) {
    on<ChipEventOnClick>(_onClick);
  }

  FutureOr<void> _onClick(ChipEventOnClick event, Emitter<ChipState> emit) {
    emit(ChipStateClicked(id: event.id));
  }
}
