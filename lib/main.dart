import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylearning/features/todo/bloc/todo_bloc.dart';
import 'package:mylearning/features/todo/view/todo_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => ToDoBLoC())],
      child: MaterialApp(
        home: ToDoView(),
      ),
    );
  }
}
