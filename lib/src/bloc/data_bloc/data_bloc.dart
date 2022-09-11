import 'dart:async';

import 'package:alex_calendar/src/models/todo.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(DataInitial()) {
    on<DataEventAddTodo>(_onAddTodo);
  }

  FutureOr<void> _onAddTodo(DataEventAddTodo event, Emitter<DataState> emit) async {
      await FirebaseFirestore.instance.collection('users').doc(event.user.email).collection('todo_list').add(
          {
            'date' : event.todo.dateTime,
            'title' : event.todo.title,
            'description' : event.todo.description,
            'role' : event.todo.role,
          }
      ).then((value) {
        debugPrint(value.id);
      });
  }
}
