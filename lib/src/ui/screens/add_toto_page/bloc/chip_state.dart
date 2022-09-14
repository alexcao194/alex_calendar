part of 'chip_bloc.dart';

abstract class ChipState extends Equatable {
  final Roles role;
  const ChipState({required this.role});

  @override
  List<Object?> get props => [role];
}

class ChipInitial extends ChipState {
  const ChipInitial({required super.role});
}

class ChipStateClicked extends ChipState {
  const ChipStateClicked({required super.role});
}