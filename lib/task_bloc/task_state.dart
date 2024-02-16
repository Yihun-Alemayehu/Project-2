part of 'task_bloc.dart';

abstract class TaskState extends Equatable {
  final List<Task> tasks;
  const TaskState({
    this.tasks = const [],
  });

  @override
  List<Object> get props => [tasks];
}

