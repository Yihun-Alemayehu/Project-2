import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_2/data/models/task_model.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<AddTaskEvent>((event, emit) {
      emit(TaskState(tasks: List.from(state.tasks)..add(event.task)));
    });
    on<UpdateTaskEvent>((event, emit) {
      emit(TaskState(tasks: List.from(state.tasks)..add(event.task)));
    });
    on<DeleteTaskEvent>((event, emit) {
      
    });
  }
}
