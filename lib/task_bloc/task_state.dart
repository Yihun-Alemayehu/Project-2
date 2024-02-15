part of 'task_bloc.dart';

sealed class TaskState extends Equatable {
  const TaskState();
  
  @override
  List<Object> get props => [];
}

final class TaskInitial extends TaskState {}
