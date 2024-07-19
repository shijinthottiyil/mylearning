import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylearning/cubit/todo_cubit.dart';
import 'package:mylearning/todo_cubit_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ToDoCubit()),
      ],
      child: MaterialApp(
        home: ToDoCubitView(),
      ),
    );
  }
}
