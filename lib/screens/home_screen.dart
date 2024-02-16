import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_2/task_bloc/task_bloc.dart';
import 'package:project_2/widgets/task_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Task manager'),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    // context.read<TaskBloc>().add(AddTaskEvent(task: state.tasks));
                  },
                ),
              ],
            ),
            body: Center(
              child: Column(
                children: [TaskList(tasks: state.tasks)],
              ),
            ));
      },
    );
  }
}
