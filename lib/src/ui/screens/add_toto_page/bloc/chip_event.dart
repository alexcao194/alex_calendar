part of 'chip_bloc.dart';

abstract class ChipEvent extends Equatable {
  const ChipEvent();
}

class ChipEventOnClick extends ChipEvent {
  const ChipEventOnClick({required this.id});

  final int id;

  @override
  List<Object?> get props => [id];
}