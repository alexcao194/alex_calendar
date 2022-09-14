part of 'chip_bloc.dart';

abstract class ChipEvent extends Equatable {
  const ChipEvent();
}

class ChipEventOnClick extends ChipEvent {
  const ChipEventOnClick({required this.role});

  final Roles role;

  @override
  List<Object?> get props => [role];
}