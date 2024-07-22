import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylearning/feature/todo/bloc/todo_bloc.dart';
import 'package:mylearning/feature/todo/view/todo_view.dart';

// My Try For Building a ToDo Application
// Using BLoC Library.
void main() {
  runApp(const BLocToDoApp());
}

class BLocToDoApp extends StatelessWidget {
  const BLocToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TodoBloc()),
      ],
      child: MaterialApp(
        home: ToDoView(),
      ),
    );
  }
}
