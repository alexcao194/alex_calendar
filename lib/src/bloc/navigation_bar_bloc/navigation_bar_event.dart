part of 'navigation_bar_bloc.dart';

abstract class NavigationBarEvent extends Equatable {
  const NavigationBarEvent();
}

class NavigationBarEventOnChangeItem extends NavigationBarEvent {
  final int id;
  final PageController pageController;

  const NavigationBarEventOnChangeItem({required this.id,required this.pageController});

  @override
  List<Object?> get props => [id, pageController];
}

class NavigationBarEventOnChangePageView extends NavigationBarEvent {

  final int id;

  const NavigationBarEventOnChangePageView({required this.id});

  @override
  List<Object?> get props => [id];
}