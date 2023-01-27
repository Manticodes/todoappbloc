part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> allTasks;
  final List<Task> deletedTasks;
  const TasksState(
      {required this.allTasks ,required this.deletedTasks });

  @override
  List<Object> get props => [allTasks, deletedTasks];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'allTasks': allTasks.map((x) => x.toMap()).toList()});
    result
        .addAll({'removedTasks': deletedTasks.map((x) => x.toMap()).toList()});

    return result;
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      allTasks: List<Task>.from(map['allTasks']?.map((x) => Task.fromMap(x))),
      deletedTasks:
          List<Task>.from(map['removedTasks']?.map((x) => Task.fromMap(x))),
    );
  }
}

class TaskInitial extends TasksState {
  const TaskInitial({required super.allTasks, required super.deletedTasks});
}
