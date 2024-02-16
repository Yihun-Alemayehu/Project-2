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
      final int index = state.tasks.indexOf(event.task);
      List<Task> tasks = List.from(state.tasks)..remove(event.task);
      event.task.isDone == false
          ? tasks.insert(index, event.task.copyWith(isDone: true))
          : tasks.insert(index, event.task.copyWith(isDone: false));
      emit(TaskState(tasks: tasks));
    });
    on<DeleteTaskEvent>((event, emit) {
      final int index = state.tasks.indexOf(event.task);
      List<Task> tasks = List.from(state.tasks);
      tasks.removeAt(index);
      emit(
        TaskState(
          tasks: List.from(state.tasks)..remove(event.task),
        ),
      );
    });
  }
}
