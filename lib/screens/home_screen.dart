import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_2/data/models/task_model.dart';
import 'package:project_2/task_bloc/task_bloc.dart';
import 'package:project_2/widgets/task_list.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController _controller = TextEditingController();

  void _addTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Spacer(),
                const Text('Add new Task'),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    label: const Text("Title"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  height: 60,
                  minWidth: MediaQuery.of(context).size.width,
                  color: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: () {
                    context.read<TaskBloc>().add(
                          AddTaskEvent(
                            task: Task(
                                title: _controller.text,
                                description:
                                    "This task is the second one in the list",
                                isDone: false),
                          ),
                        );
                    _controller.clear();
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Add new task',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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
                  onPressed: () => _addTask(context),
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
