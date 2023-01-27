import 'package:equatable/equatable.dart';
import 'package:todoappbloc/blocs/bloc_exports.dart';

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends HydratedBloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchInitial(switchValue: false)) {
    on<SwitchEvent>(_switchOnEvent);
  }

  void _switchOnEvent(SwitchEvent event, Emitter<SwitchState> emit) {
    final state = this.state;
    final bool newstate = !state.switchValue;
    emit(SwitchState(switchValue: newstate));
  }

  @override
  SwitchState? fromJson(Map<String, dynamic> json) {
    return SwitchState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(SwitchState state) {
    return state.toMap();
  }
}
