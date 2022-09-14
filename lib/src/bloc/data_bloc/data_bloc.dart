// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:alex_calendar/src/models/todo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(DataInitial()) {
    on<DataEventAddTodo>(_onAddTodo);
  }

  FutureOr<void> _onAddTodo(DataEventAddTodo event, Emitter<DataState> emit) async {

  }
}
