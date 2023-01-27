part of 'switch_bloc.dart';

class SwitchState extends Equatable {
  const SwitchState({
    required this.switchValue,
  });
  final bool switchValue;

  @override
  List<Object> get props => [switchValue];
}

class SwitchInitial extends SwitchState {
  const SwitchInitial({required super.switchValue});
}
