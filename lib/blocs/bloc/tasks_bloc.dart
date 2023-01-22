import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todoappbloc/models/task.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(allTasks: List.from(state.allTasks)..add(event.task)));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;
    int index = state.allTasks.indexOf(task);
    /* List<Task> allTasks = List.from(state.allTasks)..remove(task);

    bool? isdone = !task.isDone!;
    allTasks.insert(index, task.copyWith(isDone: isdone));
    emit(TasksState(allTasks: allTasks)); */
    bool? isdone = !task.isDone!;
    List<Task> allTasks = List.from(state.allTasks);
    allTasks[index] = task.copyWith(isDone: isdone);
    emit(TasksState(allTasks: allTasks));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;
    emit(TasksState(allTasks: List.from(state.allTasks)..remove(task)));
  }
}
