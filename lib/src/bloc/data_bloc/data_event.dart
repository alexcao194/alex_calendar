part of 'data_bloc.dart';

abstract class DataEvent extends Equatable {
  const DataEvent();
}

class DataEventAddTodo extends DataEvent {
  const DataEventAddTodo({required this.user, required this.todo});
  final User? user;
  final Todo todo;
  @override
  List<Object?> get props => [user, todo];
}

class DataEventUpdateTodo extends DataEvent {
  const DataEventUpdateTodo({required this.user, required this.todo});
  final User? user;
  final Todo todo;
  @override
  List<Object?> get props => [user, todo];
}

class DataEventRemoveTodo extends DataEvent {
  const DataEventRemoveTodo({required this.user, required this.todo});
  final User? user;
  final Todo todo;
  @override
  List<Object?> get props => [user, todo];
}

class DataEventCallDialog extends DataEvent {
  const DataEventCallDialog(this.user, this.date);

  final User? user;
  final DateTime date;
  @override
  List<Object?> get props => [];
}

