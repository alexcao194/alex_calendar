part of 'chip_bloc.dart';

abstract class ChipState extends Equatable {
  final int id;
  const ChipState({required this.id});
}

class ChipInitial extends ChipState {
  const ChipInitial({required super.id});
  @override
  List<Object> get props => [id];
}

class ChipStateClicked extends ChipState {
  const ChipStateClicked({required super.id});

  @override
  List<Object?> get props => [id];
}