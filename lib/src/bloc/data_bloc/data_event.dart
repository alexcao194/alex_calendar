part of 'data_bloc.dart';

abstract class DataEvent extends Equatable {
  const DataEvent();
}

class DataEventAddTodo extends DataEvent {
  const DataEventAddTodo({required this.user, required this.todo});

  final User user;
  final Todo todo;

  @override
  // TODO: implement props
  List<Object?> get props => [user, todo];
}