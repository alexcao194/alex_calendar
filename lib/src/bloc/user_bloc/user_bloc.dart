import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEventSignUp>(_onSignUp);
    on<UserEventRegistry>(_onRegistry);
    on<UserEventLogin>(_onLogin);
    on<UserEventGetPassword>(_onGetPassword);
    on<UserEventChangePassword>(_onChangePassword);
    }

  FutureOr<void> _onSignUp(UserEventSignUp event, Emitter<UserState> emit) {
  }

  FutureOr<void> _onRegistry(UserEventRegistry event, Emitter<UserState> emit) {
  }

  FutureOr<void> _onLogin(UserEventLogin event, Emitter<UserState> emit) {
  }

  FutureOr<void> _onGetPassword(UserEventGetPassword event, Emitter<UserState> emit) {
  }

  FutureOr<void> _onChangePassword(UserEventChangePassword event, Emitter<UserState> emit) {
  }
}
