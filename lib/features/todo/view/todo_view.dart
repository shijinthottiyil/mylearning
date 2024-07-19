import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylearning/features/todo/bloc/todo_bloc.dart';
import 'package:mylearning/features/todo/view/add_todo_view.dart';

class ToDoView extends StatelessWidget {
  const ToDoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo BLoC'),
      ),
      body: BlocBuilder<ToDoBLoC, ToDoState>(
        builder: (context, state) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('${state.listOfToDoModel[index].title}'),
              );
            },
            itemCount: state.listOfToDoModel.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
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
