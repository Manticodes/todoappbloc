part of 'tasks_bloc.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

class AddTask extends TasksEvent {
  final Task task;
  const AddTask({
    required this.task,
  });
  @override
  List<Object> get props => [task];
}

class UpdateTask extends TasksEvent {
  final Task task;
  const UpdateTask({
    required this.task,
  });
  @override
  List<Object> get props => [task];
}

class DeleteTask extends TasksEvent {
  final Task task;
  const DeleteTask({
    required this.task,
  });
  @override
  List<Object> get props => [task];
}

class RemovedTask extends TasksEvent {
  final Task task;
  const RemovedTask({
    required this.task,
  });
  @override
  List<Object> get props => [task];
}

class FavTask extends TasksEvent {
  final Task task;
  const FavTask({
    required this.task,
  });
  @override
  List<Object> get props => [task];
}

class EditTask extends TasksEvent {
  final Task task;
  final Task oldtask;
  const EditTask({
    required this.task,
    required this.oldtask,
  });
  @override
  List<Object> get props => [task, oldtask];
}

class DeleteBin extends TasksEvent {}

class RestoreTask extends TasksEvent {
  final Task task;
  const RestoreTask({
    required this.task,
  });
  @override
  List<Object> get props => [task];
}
