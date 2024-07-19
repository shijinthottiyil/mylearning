import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylearning/add_todo_view.dart';
import 'package:mylearning/cubit/todo_cubit.dart';
import 'package:mylearning/cubit/todo_model.dart';

class ToDoCubitView extends StatelessWidget {
  const ToDoCubitView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo'),
      ),
      body: BlocBuilder<ToDoCubit, List<ToDoModel>>(
        builder: (context, state) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final ToDoModel toDoModel = state[index];
              return ListTile(
                title: Text(toDoModel.title),
              );
            },
            itemCount: state.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return AddToDoView();
              },
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
