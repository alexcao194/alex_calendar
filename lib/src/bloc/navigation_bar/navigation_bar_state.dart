part of 'navigation_bar_bloc.dart';

abstract class NavigationBarState extends Equatable {
  final int currentId;
  const NavigationBarState({required this.currentId});

  @override
  List<Object?> get props => [currentId];
}

class NavigationBarInitial extends NavigationBarState {
  const NavigationBarInitial({required super.currentId});

  @override
  List<Object> get props => [currentId];
}

class NavigationBarStateItemChanged extends NavigationBarState {
  const NavigationBarStateItemChanged({required super.currentId});

  @override
  List<Object?> get props => [currentId];
}
