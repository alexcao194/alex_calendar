// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'navigation_bar_event.dart';
part 'navigation_bar_state.dart';

class NavigationBarBloc extends Bloc<NavigationBarEvent, NavigationBarState> {
  NavigationBarBloc() : super(const NavigationBarInitial(currentId: 0)) {
    on<NavigationBarEventOnChangeItem>(_onChangeItem);
    on<NavigationBarEventOnChangePageView>(_onChangePage);
  }

  FutureOr<void> _onChangeItem(NavigationBarEventOnChangeItem event, Emitter emit) async {
    event.pageController.animateToPage(event.id, duration: const Duration(milliseconds: 300), curve: Curves.linearToEaseOut);
    emit(NavigationBarStateItemChanged(currentId: event.id));
  }



  FutureOr<void> _onChangePage(NavigationBarEventOnChangePageView event, Emitter<NavigationBarState> emit) {
    emit(NavigationBarStateItemChanged(currentId: event.id));
  }
}
