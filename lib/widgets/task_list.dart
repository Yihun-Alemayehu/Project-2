import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_2/data/models/task_model.dart';
import 'package:project_2/task_bloc/task_bloc.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;

   TaskList({
    super.key,
    required this.tasks,
  });
  
  final TextEditingController _controller = TextEditingController();

  void _updateTask(BuildContext context){
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
                const Text('Edit Task'),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  autofocus: true,
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
                          UpdateTaskEvent(
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
                    'Done ',
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

  void _deleteTask (BuildContext context){

  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        var task = tasks[index];
        return ListTile(
          title: GestureDetector(
            onTap: (){
              context.read<TaskBloc>().add(DeleteTaskEvent(task: task));
            },
            child: Text(task.title)),
          subtitle: Text(task.description),
          trailing: Checkbox(
            value: task.isDone,
            onChanged: (value) {
              // context.read<TaskBloc>().add(DeleteTaskEvent(task: task));
              context.read<TaskBloc>().add(UpdateTaskEvent(task: task));
            },
          ),
        );
      },
    ));
  }
}
