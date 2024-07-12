import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_2/features/post/presentation/screens/add_post_screen.dart';
import 'package:project_2/features/todo/models/task_model.dart';
import 'package:project_2/features/todo/screens/home_screen.dart';
import 'package:project_2/features/todo/task_bloc/task_bloc.dart';
import 'package:project_2/firebase_options.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc()
        ..add(
          AddTaskEvent(
            task: Task(
                title: "task 1",
                description: "this one is the first task added by manually",
                isDone: false),
          ),
        ),
      child: const MaterialApp(
        home: AddPostScreen(),
      ),
    );
  }
}
