import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:todoappbloc/models/task.dart';
import '../bloc_exports.dart';
part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc()
      : super(const TasksState(allTasks: <Task>[], deletedTasks: <Task>[])) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<RemovedTask>(_onRemovedTask);
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(
        allTasks: List.from(state.allTasks)..add(event.task),
        deletedTasks: state.deletedTasks));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;
    int index = state.allTasks.indexOf(task);
    bool? isdone = !task.isDone!;
    List<Task> allTasks = List.from(state.allTasks);
    allTasks[index] = task.copyWith(isDone: isdone);
    emit(TasksState(allTasks: allTasks, deletedTasks: state.deletedTasks));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;
    emit(TasksState(
        allTasks: List.from(state.allTasks)..remove(task),
        deletedTasks: List.from(state.deletedTasks)
          ..add(event.task.copyWith(isDeleted: true))));
  }

  void _onRemovedTask(RemovedTask event, Emitter<TasksState> emit) {
    final task = event.task;
    final state = this.state;
    emit(TasksState(
        allTasks: state.allTasks,
        deletedTasks: List.from(state.deletedTasks)..remove(task)));
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    return TasksState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    return state.toMap();
  }
}
