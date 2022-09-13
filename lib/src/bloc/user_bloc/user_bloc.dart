import 'dart:async';

import 'package:alex_calendar/src/constant/app_strings.dart';
import 'package:alex_calendar/src/services/router.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
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

  FutureOr<void> _onSignUp(UserEventSignUp event, Emitter<UserState> emit) async {
    emit(UserInitial());
    if (event.password == '' || event.password == '') {
      emit(const UserStateSignUpFail(error: AppStrings.emptyInput));
    } else if (event.rePassword.compareTo(event.password) == 0) {
      try {
        emit(const UserStateLoading());
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: event.email, password: event.password)
            .then((value) {
          emit(const UserStateSignUpSuccessful());
          AppRouter.navigatorKey.currentState
              ?.pushReplacementNamed(AppRoutes.registryPage);
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          emit(const UserStateSignUpFail(error: AppStrings.invalidPassword));
        } else if (e.code == 'email-already-in-use') {
          emit(const UserStateSignUpFail(error: AppStrings.emailSigned));
        } else if (e.code == 'invalid-email') {
          emit(const UserStateSignUpFail(error: AppStrings.invalidEmail));
        }
      } catch (e) {
        print('lỗi: $e');
      }
    } else {
      emit(const UserStateSignUpFail(error: AppStrings.inComparePassword));
    }
  }

  FutureOr<void> _onRegistry(UserEventRegistry event, Emitter<UserState> emit) async {
    if (event.nickName == '' || event.displayName == '') {
      emit(const UserStateRegistryFail(error: AppStrings.emptyInformation));
    } else {
      emit(const UserStateLoading());
      User? user = FirebaseAuth.instance.currentUser;
      if(user!.displayName == null) {
        user.updateDisplayName(event.displayName);
        user.updatePhotoURL(event.avatarURL);
        FirebaseFirestore.instance.collection('users').doc(user.email).set({
          'nick-name': event.nickName,
          'display-name': event.displayName,
          'birthday': event.birthday
        });
        await user.sendEmailVerification().then((value) => emit(const UserStateRegistrySuccessful(status: AppStrings.registrySuccessful)));
      } else {
        emit(const UserStateRegistryFail(error: AppStrings.emailRegistered));
      }
    }
  }

  FutureOr<void> _onLogin(UserEventLogin event, Emitter<UserState> emit) async {
    emit(UserInitial());
    try {
      emit(const UserStateLoading());
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: event.email, password: event.password)
          .then((value) {
        if (value.user!.emailVerified) {
          emit(UserStateLoginSuccessful(user: value.user!));
          AppRouter.navigatorKey.currentState
              ?.pushReplacementNamed(AppRoutes.homePage);
        } else {
          emit(const UserStateLoginFail(error: AppStrings.emailUnverified));
        }
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(const UserStateLoginFail(error: AppStrings.userNotFound));
      } else if (e.code == 'wrong-password') {
        emit(const UserStateLoginFail(error: AppStrings.incorrectPassword));
      } else if (e.code == 'invalid-email') {
        emit(const UserStateLoginFail(error: AppStrings.invalidEmail));
      } else if (e.code == 'unknown') {
        emit(const UserStateLoginFail(error: AppStrings.emptyInput));
      } else {
        print('lỗi ${e.code}');
      }
    }
  }

  FutureOr<void> _onGetPassword(UserEventGetPassword event, Emitter<UserState> emit) async {
    emit(UserInitial());
    try {
      emit(const UserStateLoading());
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: event.email)
          .then((value) => emit(const UserStateGetPasswordSuccessful(
              status: AppStrings.getPasswordSuccessful)));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'unknown') {
        emit(const UserStateGetPasswordFail(error: AppStrings.emptyEmail));
      } else if (e.code == 'invalid-email') {
        emit(const UserStateGetPasswordFail(error: AppStrings.invalidEmail));
      } else if (e.code == 'user-not-found') {
        emit(const UserStateGetPasswordFail(error: AppStrings.userNotFound));
      } else {
        print('Lỗi: ${e.code}');
      }
    }
  }

  FutureOr<void> _onChangePassword(UserEventChangePassword event, Emitter<UserState> emit) {}
}
